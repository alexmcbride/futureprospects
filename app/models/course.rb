class Course < ApplicationRecord
  enum status: [:open, :cancelled, :closed, :clearance]

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

  # Callbacks
  before_validation :default_to_open_status

  # Foreign Keys
  belongs_to :college
  belongs_to :category, counter_cache: true
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
  def default_to_open_status
    unless self.status
      self.status = :open
    end
  end

  # Filters courses by title
  def self.filter_by_title(courses, title)
    unless title.nil? or title.empty?
      return courses.where('LOWER(title) LIKE LOWER(?)', "%#{title}%")
    end
    courses
  end

  # Filters courses by category
  def self.filter_by_category(courses, category_id)
    unless category_id.nil? or category_id.to_i == 0
      return courses.where(category_id: category_id)
    end
    courses
  end

  # Filters courses by status
  def self.filter_by_status(courses, status)
    unless status.nil? or status.to_i == -1
      return courses.where(status: status)
    end
    courses
  end

  # Sort courses
  def self.sort_courses(courses, sort, dir)
    if sort.nil?
      return courses.order :title
    end

    sort = sort.to_sym
    if [:title, :category_id, :status, :students].include? sort
      sort = :course_selections_count if sort == :students

      dir.downcase! if dir
      if not dir or dir == 'asc'
        return courses.order sort
      else
        return courses.order("#{sort} DESC")
      end
    end

    courses
  end

  # Filter and sort the courses
  def self.filter_and_sort(params)
    courses = Course.all
    courses = filter_by_title courses, params[:title]
    courses =  filter_by_category courses, params[:category_id]
    courses = filter_by_status courses, params[:status]
    courses = sort_courses courses, params[:sort], params[:dir]
    courses
  end

  # Gets a boolean indicating if the course can be deleted.
  def remove_valid?(title)
    if title != self.title
      self.errors.add(:title, "does not match '#{self.title}'")
    end

    unless self.course_selections.nil? or self.course_selections.empty?
      self.errors.add(:course, 'has one or more students who have applied for the course and so cannot be removed')
    end

    self.errors.empty?
  end

  # Updates attributes and sends mass cancellation email if status changed to cancelled
  def update_with_status(params)
    previous_status = self.status
    if self.update params
      # If status changed to cancelled, send notification email to students.
      if self.status != previous_status && self.cancelled?
        self.course_selections.each do |selection|
          student = selection.application.student
          StudentMailer.course_cancelled(student, self).deliver_later
        end
      end
      return true
    end
    false
  end
end
