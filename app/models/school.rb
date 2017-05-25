# * Name: Alex McBride
# * Date: 25/05/2017
# * Project: Future Prospects
# * Model class to represent a student's school.
class School < ApplicationRecord
  validates :name, presence: true, length: {maximum: 70}
  validates :address_1, presence: true, length: {maximum: 35}
  validates :address_2, presence: false, length: {maximum: 35}
  validates :city, presence: true, length: {maximum: 35}
  validates :postcode, presence: true, length: { maximum: 8 }
  validates :country, presence: true, length: { maximum: 35 }

  # @!attribute application
  #   @return [Application]
  #   The school's parent application.
  belongs_to :application

  # @!attribute qualifications
  #   @return [Array<Qualification>]
  #   The school's one-to-many association with qualifications.
  has_many :qualifications, dependent: :destroy

  # @!attribute course
  #   @param course [Course] the course to filter results by.
  #   @return [Array<School>]
  #   Scope to query for schools of student's who have applied for the specified course.
  scope :course, ->(course){School.joins(application: :course_selections).where('course_selections.course_id' => course.id)}

  # Checks if the school has at least one qualification.
  #
  # @return [Boolean] true if the school has at least a single qualification.
  def qualifications_valid?
    not self.qualifications.empty?
  end

  # Adds a qualification to the school.
  #
  # @param qualification [Qualification] the qualification to add.
  # @return [Boolean] true if the operation was successful.
  def add_qualification(qualification)
    if qualification.valid?
      qualification.school = self
      qualification.save
      return true
    end
    false
  end

  # Destroys school and any associated qualifications
  def destroy_with_qualifications
    self.qualifications.destroy_all
    self.destroy
  end

  # Searches for a school with the specified name.
  #
  # @param term [String] the name to search for.
  # @return [Array<School>]
  def self.search(term)
    if term.nil? or term.empty?
      return School.none
    end
    School.select('DISTINCT name, address_1, address_2, city, postcode, country').where('LOWER(name) LIKE LOWER(?)', "%#{term}%")
  end
end
