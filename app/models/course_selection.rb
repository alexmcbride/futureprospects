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
  validate :course_not_full, on: :create
  validate :application_can_add, on: :create
  validates :note, presence: true, if: :rejected? || :conditional_offer
  # validates :offer_date, presence: true, if: :rejected? || :conditional_offer? || :definite_offer?

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
    CourseSelection.select('DISTINCT course_selections.application_id')
        .joins(:course)
        .where('courses.college_id' => college.id)
        .count
  end

  # Calculates the number of course selections for the specified college
  #
  # * +college+ - the college to count course selection for.
  #
  # Returns - an integer with the number of course selections.
  def self.count_courses(college)
    CourseSelection.joins(:course).where('courses.college_id' => college.id).count
  end

  # Gets the colleges that the application has applied to.
  #
  # * +application+ - the application to find colleges for.
  #
  # Returns - ActiveRecord::Relation.
  def self.selected_colleges(application)
    application.course_selections
        .select('DISTINCT (colleges.*)')
        .joins(course: :college)
        .where(student_choice: [:firm_choice, :insurance_choice])
  end

  # Determines if the student has made all their choices.
  #
  # Returns - boolean true if they do have all choices.
  def has_all_choices?
    self.application.course_selections.all? {|s| s.student_choice.present? || s.rejected?}
  end

  # Updates course selection for firm_choice
  #
  # Returns - true if the student has made all their choices
  def make_firm_choice
    self.student_choice = :firm_choice
    save!
    has_all_choices?
  end

  # Updates course selection for insurance choice.
  def make_insurance_choice
    self.student_choice = :insurance_choice
    save!
    CourseSelection.decline_all(self.application)
  end

  # Clears all of a student's choices.
  #
  # * +application+ - the application to clear choices for.
  def self.clear_all_choices(application)
    application.course_selections.each do |selection|
      selection.student_choice = nil
      selection.save!
    end
  end

  # Declines choices on an application.
  #
  # * +which+ - which offer to decline (either :all or :insurance)
  # * +application+ - the application to decline the offers for.
  def self.decline(which, application)
    if which == :all
      decline_all application
    elsif which == :insurance
      decline_insurance application
    end
  end

  private
    # Declines all of a student's choices.
    #
    # * +application+ - the application to decline choices for.
    def self.decline_all(application)
      application.course_selections.each do |selection|
        unless selection.firm_choice? or selection.insurance_choice?
          selection.student_choice = :declined
          selection.save!
        end
      end
    end

    # Declines student's insurance choice.
    #
    # * +application+ - the application to decline for.
    def self.decline_insurance(application)
      application.course_selections.each do |selection|
        unless selection.firm_choice?
          selection.student_choice = :declined
          selection.save!
        end
      end
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

    # Adds a validation error if the course is full.
    def course_not_full
      if self.course.full?
        self.errors.add(:course, 'is full')
      end
    end
end
