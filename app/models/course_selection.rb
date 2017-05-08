# Model class for a CourseSelection. Stores the courses associated with a particular application.
class CourseSelection < ApplicationRecord
  include ActionView::Helpers::TextHelper

  # Enums
  enum college_offer: [:rejected, :conditional_offer, :definite_offer]
  enum student_choice: [:firm_choice, :insurance_choice, :declined]

  # Validators
  validates :application_id, presence: true
  validates :course_id, presence: true
  validate :course_is_unique, on: :create
  validate :course_is_open, on: :create
  validate :application_can_add, on: :create
  validates :note, presence: true, if: :rejected? || :conditional?

  # Associations
  belongs_to :application, counter_cache: true
  belongs_to :course, counter_cache: true

  # Checks if a course selection already exists.
  #
  # Returns - a boolean indicating if the selection exists.
  def exists?
    CourseSelection.exists? self.application_id, self.course_id
  end

  def self.exists?(application_id, course_id)
    not CourseSelection.where('application_id=? AND course_id=?', application_id, course_id).empty?
  end

  # Adds a validation error if the course selection is not unique.
  def course_is_unique
    if CourseSelection.exists? self.application_id, self.course_id
      self.errors.add(:course, 'has already been added to the application')
    end
  end

  # Adds a validation error if the course does not have a open status.
  def course_is_open
    if self.course
      unless self.course.open?
        self.errors.add(:course, "cannot be added as its marked as '#{self.course.status}'")
      end
    end
  end

  # Adds a validation error if the application already has max number courses added.
  def application_can_add
    unless self.application.can_add_course?
      self.errors.add(:maximum, "of #{pluralize Application::MAX_COURSES, 'course'} has been reached")
    end
  end

  # Creates a new CourseSelection object based on the course_id.
  #
  # * +params+ - the rquest params including the course_id.
  #
  # Returns - a new CourseSelection object with the course_id set.
  def self.from_course_id(params)
    selection = CourseSelection.new
    selection.course_id = params[:course_id]
    selection
  end

  # Calculates the number of applicants for the specified college
  #
  # * +college+ - the college to count applicants for.
  #
  # Returns - an integer with the number of applicants.
  def self.count_applicants(college)
    sql = 'SELECT COUNT(DISTINCT s.application_id)
           FROM course_selections s
           JOIN courses c ON s.course_id=c.id
           WHERE c.college_id=%d'
    sql = ActiveRecord::Base.send(:sanitize_sql, [sql, college.id]) # Sanitise SQL
    result = ActiveRecord::Base.connection.execute(sql)
    result.first['count']
  end

  # Calculates the number of course selections for the specified college
  #
  # * +college+ - the college to count course selection for.
  #
  # Returns - an integer with the number of course selections.
  def self.count_courses(college)
    sql = "SELECT COUNT(*)
           FROM course_selections s
           JOIN courses c ON s.course_id=c.id
           WHERE c.college_id=#{college.id};"
    sql = ActiveRecord::Base.send(:sanitize_sql, [sql, college.id]) # Sanitise SQL
    result = ActiveRecord::Base.connection.execute(sql)
    result.first['count']
  end

  def self.selected_colleges(application)
    application.course_selections
        .select('DISTINCT (colleges.*)')
        .joins(course: :college)
        .where(student_choice: [:firm_choice, :insurance_choice])
  end

  def has_all_choices?
    self.application.course_selections.all? {|s| s.student_choice.present? || s.rejected?}
  end

  def make_firm_choice
    self.student_choice = :firm_choice
    save!
    has_all_choices?
  end

  def make_insurance_choice
    self.student_choice = :insurance_choice
    save!
    CourseSelection.decline_all(self.application)
  end

  def self.clear_all_choices(application)
    application.course_selections.each do |selection|
      selection.student_choice = nil
      selection.save!
    end
  end

  def self.decline_all(application)
    application.course_selections.each do |selection|
      unless selection.firm_choice? or selection.insurance_choice?
        selection.student_choice = :declined
        selection.save!
      end
    end
  end

  def self.decline_insurance(application)
    application.course_selections.each do |selection|
      unless selection.firm_choice?
        selection.student_choice = :declined
        selection.save!
      end
    end
  end
end
