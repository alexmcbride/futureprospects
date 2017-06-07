# * Name: Alex McBride
# * Date: 24/05/2017
# * Project: Future Prospects
# * Model class to represent a college.
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

  # @!attribute id
  #   @return [Integer]
  #   The model ID.

  # @!attribute name
  #   @return [String]
  #   The name of the college.

  # @!attribute description
  #   @return [String]
  #   The college description.

  # @!attribute address
  #   @return [String]
  #   The college address.

  # @!attribute postcode
  #   @return [String]
  #   The college post code.

  # @!attribute telephone
  #   @return [String]
  #   The college telephone number.

  # @!attribute email
  #   @return [String]
  #   The college email.

  # @!attribute website
  #   @return [String]
  #   The college website URL.

  # @!attribute created_at
  #   @return [DateTime]
  #   The creation time.

  # @!attribute updated_at
  #   @return [DateTime]
  #   The last update time.

  # @!attribute image
  #   @return [String]
  #   The uploaded image URL.

  # @!attribute clearance
  #   @return [Boolean]
  #   Whether he college is in clearance.

  # @!attribute courses
  #   @return [Course[]]
  #   The college's one-to-many association with courses.
  has_many :courses, dependent: :destroy

  # @!attribute staff
  #   @return [Staff[]]
  #   The college's one-to-many association with staff.
  has_many :staff, dependent: :destroy

  # Calculates the number applicants to this college.
  #
  # @param year [Integer] an optional year to count applicants in.
  # @return [Integer]
  def count_applicants(year=nil)
    Application.current(year).college(self.id).count
  end

  # Calculates the number of courses that have been applied for.
  #
  # @param year [Integer] an optional year to count course selections in.
  # @return [Integer]
  def count_course_selections(year=nil)
    Application.current(year).joins(course_selections: :course).where('courses.college_id' => self.id).count
  end

  # Removes the college if the specified name matches.
  #
  # @param college_name [String] the name of the college, as entered by the user.
  # @return [Boolean] true if the operation was successful.
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

  # Finds all applications at this college that are eligable for clearance.
  #
  # @return [Array<Application>]
  def clearance_applications
    Application.current
        .select(' distinct applications.*')
        .joins(course_selections: :course)
        .where('applications.status' => [:all_rejected, :clearance])
        .where('courses.category_id' => Course.available.select('courses.category_id').where('courses.college_id' => self.id))
  end

  # Updates college and enables clearance, if needed.
  #
  # @param params [Hash] the request params.
  # @return [Boolean] true if successful.
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
  # @return [Boolean]
  def self.clearance_any?
    College.where(clearance: true).any?
  end

  # Converts the college data into a spreadsheet that can be downloaded by the user.
  #
  # @param year [Integer] the year of data to include in the spreadsheet.
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
