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
    self.spaces > self.course_selections.size
  end

  # Called before validation, adds a status if one does not exist
  def before_validation
    unless self.status
      self.status = :open
    end
  end

  # Filters courses by title
  def self.filter_by_title(title)
    courses = Course.all
    unless title.nil? or title.empty?
      courses = courses.where('LOWER(title) LIKE LOWER(?)', "%#{title}%")
    end
    courses
  end

  # Filters courses by category
  def self.filter_by_category(category_id)
    courses = Course.all
    unless category_id.nil? or category_id.to_i == 0
      courses = courses.where(category_id: category_id)
    end
    courses
  end

  # Filters courses by status
  def self.filter_by_status(status)
    courses = Course.all
    unless status.nil? or status.to_i == -1
      courses = courses.where(status: status)
    end
    courses
  end

  # Sort courses
  def self.sort_courses(sort, dir)
    if sort.nil?
      return Course.order :title
    end

    sort = sort.to_sym
    if [:title, :category_id, :status].include? sort
      dir.downcase! if dir
      if not dir or dir == 'asc'
        return Course.order sort
      else
        return Course.order("#{sort} DESC")
      end
    end

    Course.all
  end

  # Filter and sort the courses
  def self.filter_and_sort(params)
    filter_by_title params[:title]
    filter_by_category params[:category_id]
    filter_by_status params[:status]
    sort_courses params[:sort], params[:dir]
  end

  # Gets a boolean indicating if the course can be deleted.
  def can_remove?(title)
    if title != self.title
      self.errors.add(:title, "does not match '#{self.title}'")
    end

    unless self.course_selections.empty?
      self.errors.add(:course, 'has one or more students who have applied for the course and so cannot be removed')
    end

    self.title.empty?
  end

  # Removes this course, only if the title matches and no student's have applied for it.
  def remove?(title)
    if self.can_remove? title
      self.courses.destroy_all
      self.destroy
      return true
    end
    false
  end
end