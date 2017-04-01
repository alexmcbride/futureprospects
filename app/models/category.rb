class Category < ApplicationRecord
  # Validators
  validates :name, presence: true, length: { maximum: 40}, uniqueness: true

  # Foreign Keys
  has_many :courses
end
