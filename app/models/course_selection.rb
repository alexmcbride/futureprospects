class CourseSelection < ApplicationRecord

  enum college_offer: [:rejected, :conditional, :definite]
  enum student_choice: [:firm, :insurance, :declined]

  validates :application_id, presence: true
  validates :course_id, presence: true
  validate :course_is_unique
  validate :course_is_open
  validate :application_can_add

  belongs_to :application
  belongs_to :course

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
        self.errors.add(:course, "status is listed as #{self.course.status}")
      end
    end
  end

  # Validates that application can add course selection
  def application_can_add
    unless self.application.can_add_course?
      self.errors.add(:maximum, "of #{Application::MAX_COURSES} courses has been reached")
    end
  end
end
