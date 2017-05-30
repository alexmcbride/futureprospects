# * Name: Alex McBride
# * Date: 25/05/2017
# * Project: Future Prospects
# * Model class for representing a student's references.
class Reference < ApplicationRecord
  validates :reference_1_full_name, presence: true, length: {maximum: 70}
  validates :reference_1_occupation, presence: true, length: {maximum: 70}
  validates :reference_1_relationship, presence: true, length: {maximum: 35}
  validates :reference_1_address_1, presence: true, length: {maximum: 35}
  validates :reference_1_address_2, presence: false, length: {maximum: 35}
  validates :reference_1_country, presence: true, length: {maximum: 35}
  validates :reference_1_city, presence: true, length: {maximum: 35}
  validates :reference_1_postcode, presence: true, length: {maximum: 8}
  validates :reference_1_telephone, presence: true, length: {maximum: 20}
  validates :reference_1_email, presence: true, length: {maximum: 254}

  validates :reference_2_full_name, presence: true, length: {maximum: 70}
  validates :reference_2_occupation, presence: true, length: {maximum: 70}
  validates :reference_2_relationship, presence: true, length: {maximum: 35}
  validates :reference_2_address_1, presence: true, length: {maximum: 35}
  validates :reference_2_address_2, presence: false, length: {maximum: 35}
  validates :reference_2_country, presence: true, length: {maximum: 35}
  validates :reference_2_city, presence: true, length: {maximum: 35}
  validates :reference_2_postcode, presence: true, length: {maximum: 8}
  validates :reference_2_telephone, presence: true, length: {maximum: 20}
  validates :reference_2_email, presence: true, length: {maximum: 254}

  # @!attribute id
  #   @return [Fixnum]
  #   The reference ID.

  # @!attribute application_id
  #   @return [Fixnum]
  #   The application that the references belongs to.

  # @!attribute reference_1_full_name
  #   @return [String]
  #   The references full name.

  # @!attribute reference_1_occupation
  #   @return [String]
  #   The references occupation.

  # @!attribute reference_1_relationship
  #   @return [String]
  #   The references relationship to the student.

  # @!attribute reference_1_address_1
  #   @return [String]
  #   The references address first line.

  # @!attribute reference_1_address_2
  #   @return [String]
  #   The references address second line.

  # @!attribute reference_1_country
  #   @return [String]
  #   The references country of residence.

  # @!attribute reference_1_postcode
  #   @return [String]
  #   The references post code.

  # @!attribute reference_1_telephone
  #   @return [String]
  #   The references telephone number.

  # @!attribute reference_1_email
  #   @return [String]
  #   The references email.

  # @!attribute reference_1_city
  #   @return [String]
  #   The references city of residence.

  # @!attribute reference_2_full_name
  #   @return [String]
  #   The references full name.

  # @!attribute reference_2_occupation
  #   @return [String]
  #   The references occupation.

  # @!attribute reference_2_relationship
  #   @return [String]
  #   The references relationship to the student.

  # @!attribute reference_2_address_1
  #   @return [String]
  #   The references address first line.

  # @!attribute reference_2_address_2
  #   @return [String]
  #   The references address second line.

  # @!attribute reference_2_country
  #   @return [String]
  #   The references country of residence.

  # @!attribute reference_2_postcode
  #   @return [String]
  #   The references post code.

  # @!attribute reference_2_telephone
  #   @return [String]
  #   The references telephone number.

  # @!attribute reference_2_email
  #   @return [String]
  #   The references email.

  # @!attribute reference_2_city
  #   @return [String]
  #   The references city of residence.

  # @!attribute created_at
  #   @return [DateTime]
  #   The creation date.

  # @!attribute updated_at
  #   @return [DateTime]
  #   The last update time.

  # @!attribute application
  #   @return [Application]
  #   The references's parent application.
  belongs_to :application
end
