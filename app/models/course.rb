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

  # Simple course search, that looks in course title, category name, and college name.
  def self.search(term)
    term = "%#{term}%" # Add wildcards
    sql = 'LOWER(courses.title) LIKE LOWER(:term) OR '\
          'LOWER(categories.name) LIKE LOWER(:term) OR '\
          'LOWER(colleges.name) LIKE LOWER(:term)'
    Course.joins(:category).joins(:college).where(sql, term: term)
  end
end
