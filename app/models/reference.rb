# Model class for representing a student's references.
class Reference < ApplicationRecord
  validates :reference_1_full_name, presence: true, length: {maximum: 70}
  validates :reference_1_occupation, presence: true, length: {maximum: 70}
  validates :reference_1_relationship, presence: true, length: {maximum: 35}
  validates :reference_1_address_1, presence: true, length: {maximum: 35}
  validates :reference_1_address_2, presence: false, length: {maximum: 35}
  validates :reference_1_country, presence: true, length: {maximum: 35}
  validates :reference_1_postcode, presence: true, length: {maximum: 8}
  validates :reference_1_telephone, presence: true, length: {maximum: 20}
  validates :reference_1_email, presence: true, length: {maximum: 254}

  validates :reference_2_full_name, presence: true, length: {maximum: 70}
  validates :reference_2_occupation, presence: true, length: {maximum: 70}
  validates :reference_2_relationship, presence: true, length: {maximum: 35}
  validates :reference_2_address_1, presence: true, length: {maximum: 35}
  validates :reference_2_address_2, presence: false, length: {maximum: 35}
  validates :reference_2_country, presence: true, length: {maximum: 35}
  validates :reference_2_postcode, presence: true, length: {maximum: 8}
  validates :reference_2_telephone, presence: true, length: {maximum: 20}
  validates :reference_2_email, presence: true, length: {maximum: 254}

  belongs_to :application
end
