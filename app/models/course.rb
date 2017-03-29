class Course < ApplicationRecord
  self.per_page = 11

  validates :title, presence: true, length: { maximum: 100 }, uniqueness: true
  validates :description, presence: true
  validates :entry_requirements, presence: true
  validates :career_prospects, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :level, presence: true

  belongs_to :college
  belongs_to :category

  # Simple course search that looks in course title, category name, and college name.
  def self.search(search_term)
    unless search_term.empty?
      search_term = "%#{search_term}%".downcase # Prepare search term.
      sql = 'LOWER(courses.title) LIKE :term OR '\
            'LOWER(categories.name) LIKE :term OR '\
            'LOWER(colleges.name) LIKE :term'
      Course.joins(:category).joins(:college).where(sql, term: search_term)
    end
  end
end