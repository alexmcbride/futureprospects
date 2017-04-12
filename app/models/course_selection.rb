class CourseSelection < ApplicationRecord

  enum college_offer: [:rejected, :conditional, :definite]
  enum student_choice: [:firm, :insurance, :declined]

  validates :application_id, presence: true
  validates :course_id, presence: true

  belongs_to :application
  belongs_to :course

  # Checks if a course selection already exists
  def self.exists?(application_id, course_id)
    not where('application_id=? AND course_id=?', application_id, course_id).empty?
  end

  # Validates that the selection can be saved.
  def self.validate_selection?(selection)
    application = selection.application

    # Check course is unique to application
    if exists? application.id, selection.course_id
      selection.errors.add(:course, 'has already been added to the application')
      return false
    end

    course = Course.find selection.course_id

    # Check course has free spaces
    unless course.has_spaces
      selection.errors.add(:course, 'is full and has no available spaces')
      return false
    end

    # Check application has free courses
    unless application.can_add_course?
      selection.errors.add(:maximum, "of #{Application::MAX_COURSES} courses has been reached")
      return false
    end

    true # valid
  end
end
