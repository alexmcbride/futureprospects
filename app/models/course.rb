class Course < ApplicationRecord
  enum status: [:open, :cancelled, :closed, :full, :clearance]

  # Pagination
  self.per_page = 10

  # Search
  scoped_search on: :title
  scoped_search relation: :category, on: :name
  scoped_search relation: :college, on: :name

  # Image Upload
  mount_uploader :image, CourseImageUploader

  # Validators
  validates :title, presence: true, length: { maximum: 120 }, uniqueness: true
  validates :description, presence: true
  validates :entry_requirements, presence: true
  validates :career_prospects, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :level, presence: false
  validates :spaces, presence: true
  validates :category_id, presence: true
  validates :college_id, presence: true
  validates :spaces, presence: true, numericality: {only_integer: true, greater_than: 0, less_than: 120}
  validates :status, presence: true
  validates :image, presence: true

  before_validation :before_validation

  # Foreign Keys
  belongs_to :college
  belongs_to :category
  has_many :course_selections

  # Gets the number of years the course lasts for
  def years
    ((end_date - start_date).to_i / 365.0).ceil
  end

  # Gets the duration the course will last for
  def duration
    start_date..end_date
  end

  # Gets if the course is full time or part time
  def course_type
    'Full Time'
  end

  # Searches courses for the specified term
  def self.search(search_term)
    Course.search_for(search_term).includes(:category, :college)
  end

  # Checks if the course has spaces
  def has_spaces
    self.spaces > self.course_selections.count
  end

  def before_validation
    # Add default status if not set
    unless self.status
      self.status = :open
    end
  end

  # Filter and sort the courses
  def self.filter_and_sort(title, category_id, status, sort)
    courses = Course.all

    unless title.nil? or title.empty?
      courses = courses.where('LOWER(title) LIKE LOWER(?)', "%#{title}%")
    end

    unless category_id.nil? or category_id.to_i == 0
      courses = courses.where(category_id: category_id)
    end

    unless status.nil? or status.to_i == -1
      courses = courses.where(status: status)
    end

    if sort.nil?
      courses = courses.order(:title)
    else
      if sort == 'title'
        courses = courses.order(:title)
      elsif sort == 'category'
        courses = courses.order(:category_id)
      elsif sort == 'status'
        courses = courses.order(:status)
      end
    end

    courses
  end

  def remove?(title)
    if title != self.title
      self.errors.add(:title, "does not match '#{self.title}'")
    end

    unless self.course_selections.empty?
      self.errors.add(:course, 'has one or more students who have applied for the course and so cannot be removed')
    end

    if self.errors.empty?
      self.courses.destroy_all
      self.destroy
      return true
    end

    false
  end
end