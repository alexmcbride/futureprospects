class College < ApplicationRecord
  validates :name, presence: true, length: 70
  validates :description, presence: true
  validates :address, presence: true, length: 255
  validates :postcode, presence: true, length: 7
  validates :telephone, presence: true, length: 20

  has_many :courses
end
