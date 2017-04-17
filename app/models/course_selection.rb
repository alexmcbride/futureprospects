class CourseSelection < ApplicationRecord
  include ActionView::Helpers::TextHelper

  # Enums
  enum college_offer: [:rejected, :conditional, :definite]
  enum student_choice: [:firm, :insurance, :declined]

  # Validators
  validates :application_id, presence: true
  validates :course_id, presence: true
  validate :course_is_unique
  validate :course_is_open
  validate :application_can_add

  # Associations
  belongs_to :application
  belongs_to :course, counter_cache: true

  # Checks if a course selection already exists
  def exists?
    not CourseSelection.where('application_id=? AND course_id=?', self.application_id, self.course_id).empty?
  end

  # Validates that selection is unique
  def course_is_unique
    if self.exists?
      self.errors.add(:course, 'has already been added to the application')
    end
  end

  # Validates that selected course is open
  def course_is_open
    # Check course has free spaces
    if self.course
      unless self.course.open?
        self.errors.add(:course, "cannot be added as status is #{self.course.status}")
      end
    end
  end

  # Validates that application can add course selection
  def application_can_add
    unless self.application.can_add_course?
      self.errors.add(:maximum, "of #{pluralize Application::MAX_COURSES, 'course'} has been reached")
    end
  end

  # Creates a new CourseSelection object based on the course_id
  def self.from_course_id(params)
    selection = CourseSelection.new
    selection.course_id = params[:course_id]
    selection
  end

  # Calculates the number of applicants for the specified college
  def self.count_applicants(college)
    sql = 'SELECT COUNT(DISTINCT s.application_id)
           FROM course_selections s
           JOIN courses c ON s.course_id=c.id
           WHERE c.college_id=%d'
    sql = ActiveRecord::Base.send(:sanitize_sql, [sql, college.id]) # Sanitise SQL
    result = ActiveRecord::Base.connection.execute(sql)
    result.first['count']
  end

  # Counts the number of courses applied to
  def self.count_courses(college)
    sql = "SELECT COUNT(*)
           FROM course_selections s
           JOIN courses c ON s.course_id=c.id
           WHERE c.college_id=#{college.id};"
    sql = ActiveRecord::Base.send(:sanitize_sql, [sql, college.id]) # Sanitise SQL
    result = ActiveRecord::Base.connection.execute(sql)
    result.first['count']
  end
end
