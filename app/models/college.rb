class College < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :postcode, presence: true
  validates :telephone, presence: true
end
