class Course < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }, uniqueness: true
  validates :description, presence: true
  validates :entry_requirements, presence: true
  validates :career_prospects, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :level, presence: true

  belongs_to :college
  belongs_to :category
end
