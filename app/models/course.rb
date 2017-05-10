# Model class to represent a college course.
class Course < ApplicationRecord
  enum status: [:open, :cancelled, :closed, :clearance]

  # Pagination
  self.per_page = 10

  # Search
  scoped_search on: :title, profile: :title
  scoped_search on: :title, profile: :full
  scoped_search relation: :category, on: :name, profile: :full
  scoped_search relation: :college, on: :name, profile: :full

  # Image Upload
  mount_uploader :image, CourseImageUploader

  # Validators
  validates :title, presence: true, length: { maximum: 120 }
  validates :description, presence: true
  validates :entry_requirements, presence: true
  validates :career_prospects, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :level, presence: false
  validates :category_id, presence: true
  validates :college_id, presence: true
  validates :spaces, presence: true, numericality: {only_integer: true, greater_than: 0, less_than: 120}
  validates :status, presence: true
  validates :image, presence: true
  validate :spaces_greater_than_applicants, on: :update

  # Callbacks
  before_validation :default_to_open_status

  # Foreign Keys
  belongs_to :college
  belongs_to :category, counter_cache: true
  has_many :course_selections

  # Gets the number of years the course lasts for.
  #
  # Returns - the years as an integer.
  def years
    ((end_date - start_date).to_i / 365.0).ceil
  end

  # Gets the duration the course will last for.
  #
  # Returns - a duration between two dates.
  def duration
    start_date..end_date
  end

  # Gets if the course is full time or part time.
  #
  # Returns - a string with the course type.
  def course_type
    'Full Time'
  end

  # Searches course titles for the specified term.
  #
  # * +search_term+ - the term to search for.
  #
  # Returns - an ActiveRecord:Relation containing the search results.
  def self.search(search_term)
    Course.search_for(search_term, profile: :title)
  end

  # Searches course titles, categories, and colleges for the specified term.
  #
  # * +search_term+ - the term to search for.
  #
  # Returns - an ActiveRecord:Relation containing the search results
  def self.full_search(search_term)
    Course.search_for(search_term, profile: :full).includes(:category, :college)
  end

  # Checks if the course is full.
  #
  # Returns - a boolean indicating if the course has spaces.
  def full?
    self.course_selections_count >= self.spaces
  end

  # Filters the courses based on the request params (:title, :category_id, :status, and :college_id)
  #
  # * +params+ - the request params containing filtering information.
  #
  # Returns - an ActiveRecord::Relation containing the results of the filtering operation.
  def self.filter(params)
    scope = Course.search params[:title]
    unless params[:category_id].nil? or params[:category_id] == '0'
      scope = scope.where(category_id: params[:category_id])
    end
    unless params[:status].nil? or params[:status] == '-1'
      scope = scope.where(status: params[:status])
    end
    unless params[:college_id].nil? or params[:college_id] == '0'
      scope = scope.where(college_id: params[:college_id])
    end
    scope
  end

  # Removes the course if there are no course selections that include this course.
  #
  # * +title+ - the title to match against, entered by the user, as a security precaution.
  #
  # Returns - a boolean indicating if the operation was successful.
  def remove(title)
    if title != self.title
      self.errors.add(:title, "does not match '#{self.title}'")
    end

    # Check if there are any applications with this course.
    unless self.course_selections.nil? or self.course_selections.empty?
      self.errors.add(:course, 'has one or more students who have applied for the course and so cannot be removed')
    end

    # If no errors then delete.
    if self.errors.empty?
      destroy!
      return true
    end

    false
  end

  # Finds all courses with an open status.
  #
  # * +category+ - optional category the include the where clause
  #
  # Returns - An ActiveRecord::Relation including the course results.
  def self.find_open_courses(category=nil)
    if category
      Course.where(status: :open, category_id: category.id)
    else
      Course.where(status: :open)
    end
  end

  # Updates attributes and takes action depending on status change (e.g. cancelled etc).
  #
  # * +params+ - The request params including the update data.
  #
  # Returns - a boolean indicating if the operation was successful.
  def update_with_status(params)
    # Check if status has just been switched to cancelled
    if params[:status] == 'cancelled'
      cancel
    end

    # Check enter clearance mode.
    if params[:status] == 'clearance'
      clearance
    end

    self.update params
  end

  # Cancels course and emails all students who had applied for it.
  #
  # Returns - a boolean indicating if the operation was successful.
  def cancel
    # Ignore if already cancelled.
    unless self.cancelled?
      self.status = :cancelled
      self.save

      # Send email to all students.
      self.course_selections.each do |selection|
        student = selection.application.student
        StudentMailer.course_cancelled(student, self).deliver_later
      end

      return true
    end
    false
  end

  # Puts course into clearance mode and emails any students eligable for clearance.
  #
  # Returns - true if clearance was enabled.
  def clearance
    unless self.clearance?
      self.status = :clearance
      self.save

      # Send email to all matching applications.
      applications = find_clearance
      applications.each do |application|
        StudentMailer.clearance(application.student, [self]).deliver_later
      end

      return true
    end

    false
  end

  # Finds all clearance courses for the specified application.
  #
  # * +application+ - the application to find clearance courses for.
  # * +college+ - an optional college to limit the courses for.
  #
  # Returns - an ActiveRecord::Relation with
  def self.find_clearance(application, college=nil)
    categories = application.course_selections.select('courses.category_id').joins(:course)
    scope = Course.joins(:course_selections)
        .select('DISTINCT(courses.*)')
        .where('courses.status' => :open)
        .where('courses.course_selections_count<courses.spaces')
        .where(category_id: categories)

    if college
      scope = scope.where('courses.college_id' => college.id)
    end

    scope
  end

  private
    def find_clearance
      Application.select('DISTINCT (applications.*)')
          .joins(course_selections: :course)
          .where('courses.college_id' => self.college_id)
          .where('applications.status' => :all_rejected)
          .where('courses.category_id' => self.category_id)
    end

    # ActiveRecord callback, called before validation, that adds a default status if one does not exist.
    def default_to_open_status
      unless self.status
        self.status = :open
      end
    end

    # Checks that a staff member doesn't try to change spaces to be a number
    # less than the current number of applicants.
    def spaces_greater_than_applicants
      if self.spaces < self.course_selections_count
        self.errors.add(:spaces, 'cannot be less than number of applicants')
      end
    end
end
