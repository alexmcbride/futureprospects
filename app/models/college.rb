# Model class to represent a college
class College < ApplicationRecord
  # Image Upload
  mount_uploader :image, CollegeImageUploader

  # Validators
  validates :name, presence: true, length: { maximum: 70 }, uniqueness: true
  validates :description, presence: true
  validates :address, presence: true, length: { maximum: 255 }
  validates :postcode, presence: true, length: { maximum: 7 }
  validates :telephone, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :website, presence: true, length: { maximum: 255 }, uniqueness: true

  # Foreign Key
  has_many :courses
  has_many :staff

  # Calculates the number applicants to this college.
  #
  # Returns - integer for number of applications.
  def count_applicants
    CourseSelection.count_applicants self
  end

  # Calculates the number of courses that have been applied for.
  #
  # Returns - integer for number of course selections.
  def count_course_selections
    CourseSelection.count_courses self
  end

  # Removes the college, plus all staff, courses, and course selections, if the names match.
  #
  # * +college_name+ - the name of the college, as entered by the user.
  #
  # Returns - a boolean indicating if the operation was successful.
  def remove_college(college_name)
    if self.name != college_name
      errors.add(:college_name, "does not match '#{name}'")
      false
    else
      # Remove any course selection for student's that have applied to this college.
      courses.each do |course|
        course.course_selections.destroy_all
      end
      # Remove any courses & staff members
      staff.destroy_all
      courses.destroy_all
      # Remove college
      destroy
      true
    end
  end
end
