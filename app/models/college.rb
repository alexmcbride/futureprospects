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
  has_many :courses, dependent: :destroy
  has_many :staff, dependent: :destroy

  # Calculates the number applicants to this college.
  #
  # Returns integer for number of applications.
  def count_applicants(year=nil)
    Application.current(year).college(self.id).count
  end

  # Calculates the number of courses that have been applied for.
  #
  # Returns integer for number of course selections.
  def count_course_selections(year=nil)
    Application.current(year).joins(course_selections: :course).where('courses.college_id' => self.id).count
  end

  # Removes the college, plus all staff, courses, and course selections, if the names match.
  #
  # * +college_name+ - the name of the college, as entered by the user.
  #
  # Returns a boolean indicating if the operation was successful.
  def remove_college(college_name)
    if self.name != college_name
      errors.add(:college_name, "does not match '#{name}'")
      false
    else
      # Remove college
      destroy
      true
    end
  end

  # Finds all applications that have a rejected status and
  #
  def clearance_applications
    Application.current
        .select(' distinct applications.*')
        .joins(course_selections: :course)
        .where('applications.status' => [:all_rejected, :clearance])
        .where('courses.category_id' => Course.available.select('courses.category_id').where('courses.college_id' => self.id))
  end

  # Updates college and enables clearance, if needed.
  #
  # * +params+ - the request params.
  #
  # Returns true if successful, otherwise false.
  def update_for_clearance(params)
    if self.update params
      if self.clearance?
        handle_clearance
      end
      true
    end
  end

  # Determines if any colleges are in clearance mode.
  #
  # Returns true if one or more colleges are in clearance, otherwise false.
  def self.clearance_any?
    College.where(clearance: true).any?
  end

  # Converts the college data into a spreadsheet that can be downloaded by the user.
  #
  # @param year [Fixnum] the year of data to include in the spreadsheet.
  #
  # @return [Spreadsheet]
  def to_spreadsheet(year=Date.today.year)
    CollegeSpreadsheet.generate self, year
  end

  private
    # Finds clearance applications and emails students.
    def handle_clearance
      applications = self.clearance_applications
      applications.each do |application|

        application.update_status :clearance

        courses = Course.clearance_courses(application, self).includes(:college).to_a
        if courses.any?
          StudentMailer.clearance(application.student, courses).deliver_later
          StudentMessenger.new.clearance(application.student, courses)
        end
      end
    end
end
