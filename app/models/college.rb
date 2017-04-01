class College < ApplicationRecord
  # Image Upload
  mount_uploader :image, CollegeImageUploader

  # Validators
  validates :name, presence: true, length: { maximum: 70 }, uniqueness: true
  validates :description, presence: true
  validates :address, presence: true, length: { maximum: 255 }
  validates :postcode, presence: true, length: { maximum: 7 }
  validates :telephone, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :website, presence: true, length: { maximum: 255 }, uniqueness: true

  # Foreign Key
  has_many :courses
end
