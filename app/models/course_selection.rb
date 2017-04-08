class CourseSelection < ApplicationRecord
  MAX_COURSES = 5

  enum college_offer: [:rejected, :conditional, :definite]
  enum student_choice: [:firm, :insurance, :declined]

  belongs_to :application
  belongs_to :course

  def self.available_courses(application)
    MAX_COURSES - course_count(application)
  end

  def self.course_count(application)
    application.course_selections.count
  end

  # Validates that the selection can be saved.
  def self.validate_selection?(selection)
    application = selection.application

    if selection.course_id.nil?
      selection.errors.add(:course_title, "can't be blank")
      return false
    end

    # Check if course has already been added
    unless CourseSelection.where('application_id=? AND course_id=?', application.id, selection.course_id).empty?
      selection.errors.add(:course, 'has already been added to the application')
      return false
    end

    course = Course.find selection.course_id

    # Checks if course is full
    if course.course_selections.count >= course.spaces
      selection.errors.add(:course, ' is full and has no available spaces')
      return false
    end

    # Checks if student has enough course applications left over
    if course_count(application) >= MAX_COURSES
      selection.errors.add(:course, "is more than the allowed #{MAX_COURSES} courses")
      return false
    end

    true
  end
end
