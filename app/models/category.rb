class Category < ApplicationRecord
  validates :name, presence: true, length: 40

  has_many :courses
end
