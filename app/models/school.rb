# Model class to represent a student's school.
class School < ApplicationRecord
  validates :name, presence: true, length: {maximum: 70}
  validates :address_1, presence: true, length: {maximum: 35}
  validates :address_2, presence: false, length: {maximum: 35}
  validates :city, presence: true, length: {maximum: 35}
  validates :postcode, presence: true, length: { maximum: 8 }
  validates :country, presence: true, length: { maximum: 35 }

  belongs_to :application
  has_many :qualifications

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
end
