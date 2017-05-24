# Model class to represent a student's school.
class School < ApplicationRecord
  validates :name, presence: true, length: {maximum: 70}
  validates :address_1, presence: true, length: {maximum: 35}
  validates :address_2, presence: false, length: {maximum: 35}
  validates :city, presence: true, length: {maximum: 35}
  validates :postcode, presence: true, length: { maximum: 8 }
  validates :country, presence: true, length: { maximum: 35 }

  belongs_to :application
  has_many :qualifications, dependent: :destroy

  scope :course, ->(course){School.joins(application: :course_selections).where('course_selections.course_id' => course.id)}

  # Checks if the school has at least one qualification
  #
  # Returns a boolean indicating if the school has at least a single qualification.
  def qualifications_valid?
    not self.qualifications.empty?
  end

  # Adds a qualification to the school
  #
  # * +qualification+ - the qualification to add.
  #
  # Returns a boolean indicating if the operation was successful.
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
  # * +term+ - the name to search for.
  #
  # Returns a relation containing the matching schools.
  def self.search(term)
    if term.nil? or term.empty?
      return School.none
    end
    School.select('DISTINCT name, address_1, address_2, city, postcode, country').where('LOWER(name) LIKE LOWER(?)', "%#{term}%")
  end
end
