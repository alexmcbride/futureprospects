class Category < ApplicationRecord
  validates :name, presence: true, length: { maximum: 40}, uniqueness: true

  has_many :courses
end
