class Course < ApplicationRecord
  self.per_page = 10
  scoped_search on: :title
  scoped_search relation: :category, on: :name
  scoped_search relation: :college, on: :name
  mount_uploader :image, CourseImageUploader

  validates :title, presence: true, length: { maximum: 100 }, uniqueness: true
  validates :description, presence: true
  validates :entry_requirements, presence: true
  validates :career_prospects, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :level, presence: true

  belongs_to :college
  belongs_to :category

  # Gets the number of years the course will last
  def duration
    end_date.year - start_date.year
  end
end