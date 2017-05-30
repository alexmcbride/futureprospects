# * Name: Alex McBride
# * Date: 17/05/2017
# * Project: Future Prospects
# * Model class to represent a college course. Courses are children of College and Category, and are linked to an Application by the CourseSelection join table.
class Course < ApplicationRecord
  # Include
  include DateValidator

  # @!attribute status
  #   @return [symbol]
  #   Enum for course status.
  #
  #   * +:open+ - the course is open and accepting applications.
  #   * +:cancelled+ - the course has been cancelled.
  #   * +:closed+ - the course is closed.
  enum status: [:open, :cancelled, :closed]

  # Pagination
  self.per_page = 10

  # Search
  scoped_search on: :title, profile: :title
  scoped_search on: :title, profile: :full
  scoped_search relation: :category, on: :name, profile: :full
  scoped_search relation: :college, on: :name, profile: :full

  # Finds courses with +:open+ status.
  #
  # @return [Array<Course>]
  scope :available, -> {where(status: :open)}

  # Finds courses with spaces still to fill.
  #
  # @return [Array<Course>]
  scope :with_spaces, -> {where('current_selections_count<spaces')}

  # Finds all courses at the specified college.
  #
  # @param college_id [Fixnum] the ID of the college to filter results by.
  # @return [Array<Course>]
  scope :college, ->(college_id){where(college_id: college_id)}

  # Finds all courses with applicants for the specified year.
  #
  # @param year [Fixnum] the year to filter results by.
  # @return [Array<Course>]
  scope :current, ->(year){joins(course_selections: :application).where('applications.created_at' => Application.current_year(year))}

  # Image Upload
  mount_uploader :image, CourseImageUploader

  # Validators
  validates :title, presence: true, length: { maximum: 120 }
  validates :description, presence: true
  validates :entry_requirements, presence: true
  validates :career_prospects, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :level, presence: false, length: {maximum: 20}
  validates :category_id, presence: true
  validates :college_id, presence: true
  validates :spaces, presence: true, numericality: {only_integer: true, greater_than: 0, less_than: 120}
  validates :status, presence: true
  validates :image, presence: true
  validate :spaces_greater_than_applicants, on: :update

  # @!attribute id
  #   @return [Fixnum]
  #   The course ID.

  # @!attribute category_id
  #   @return [Fixnum]
  #   The category ID foreign key.

  # @!attribute college_id
  #   @return [Fixnum]
  #   The college ID foreign key.

  # @!attribute title
  #   @return [String]
  #   The course title.

  # @!attribute description
  #   @return [String]
  #   The course description.

  # @!attribute entry_requirements
  #   @return [String]
  #   The course entry_requirements.

  # @!attribute career_prospects
  #   @return [String]
  #   The course entry_requirements.

  # @!attribute start_date
  #   @return [Date]
  #   The course start date.

  # @!attribute end_date
  #   @return [Date]
  #   The course end date.

  # @!attribute level
  #   @return [String]
  #   The course SCQF level.

  # @!attribute image
  #   @return [String]
  #   The uploaded course image path.

  # @!attribute spaces
  #   @return [Fixnum]
  #   The number of spaces in the course.

  # @!attribute course_selections_count
  #   @return [Fixnum]
  #   The total number of course selections for this course.

  # @!attribute current_selections_count
  #   @return [Fixnum]
  #   The number of course selections for this course this academic year.

  # @!attribute created_at
  #   @return [DateTime]
  #   The creation date.

  # @!attribute updated_at
  #   @return [DateTime]
  #   The last update time.

  # @!attribute college
  #   @return [College]
  #   The course's parent college.
  belongs_to :college

  # @!attribute category
  #   @return [Category]
  #   The course's parent category
  belongs_to :category, counter_cache: true

  # @!attribute course_selections
  #   @return [Array<CourseSelection>]
  #   The many-to-many association between courses and applications.
  has_many :course_selections, dependent: :destroy

  # Gets the number of years the course lasts for.
  #
  # @return [fixnum] the number of years.
  def years
    ((end_date - start_date).to_i / 365.0).ceil
  end

  # Gets the duration the course will last for.
  #
  # @return [Date..Date] a range of dates dates.
  def duration
    start_date..end_date
  end

  # Gets if the course is full time or part time.
  #
  # @return [string] the course type.
  def course_type
    'Full Time'
  end

  # Searches course titles for the specified term.
  #
  # @param search_term [String] the term to search for.
  # @return [Array<Course>] the search results.
  def self.search(search_term)
    Course.search_for(search_term, profile: :title)
  end

  # Searches course titles, categories, and colleges for the specified term.
  #
  # @param search_term [String] the term to search for.
  # @return [Array<Course>] the search results
  def self.full_search(search_term, category=nil)
    scope = Course.search_for(search_term, profile: :full).includes(:category, :college)
    if category
      scope = scope.where(category_id: category.id)
    end
    scope
  end

  # Checks if the course is full.
  #
  # @return [boolean] true if the course is full.
  def full?
    self.current_selections_count >= self.spaces
  end

  # Determines if the course is in clearance
  #
  # @return [boolean] true if the course is in clearance.
  def clearance?
    can_apply? && self.college.clearance?
  end

  # Determines if the course can be applied to.
  #
  # @return [boolean] true if course can be applied to.
  def can_apply?
    self.open? && self.current_selections_count < self.spaces
  end

  # Filters the courses based on the request params (+:title+, +:category_id+, +:status+, and +:college_id+)
  #
  # @param params [Array<string>] the request params containing filtering information.
  # @return [Array<Course>] the results of the filtering operation.
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
  # @param title [String] the title to match against, entered by the user, as a security precaution.
  # @return [boolean] true if the operation was successful.
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
  # @param category [Category] optional category the include the where clause
  # @return [Array<Course>] the course results.
  def self.find_open_courses(category=nil)
    scope = Course.available

    if category
      scope = scope.where(category_id: category.id)
    end

    scope
  end

  # Updates attributes and takes action depending on status change (e.g. +:cancelled' etc).
  #
  # @param params [Hash] the request params including the update data.
  # @return [boolean] true if the operation was successful.
  def update_with_status(params)
    # Check if status has just been switched to cancelled
    if params[:status] == 'cancelled'
      cancel
    end

    self.update params
  end

  # Cancels course and emails all students who had applied for it.
  #
  # @return [boolean] true if the operation was successful.
  def cancel
    # Ignore if already cancelled.
    unless self.cancelled?
      self.status = :cancelled
      self.save

      # Send email to all students.
      self.course_selections.current.each do |selection|
        student = selection.application.student
        StudentMailer.course_cancelled(student, self).deliver_later
        StudentMessenger.new.course_cancelled(student, self)
      end

      return true
    end
    false
  end

  # Finds all courses that match clearance criteria that are within categories that have been applied for in the
  # specified application.
  #
  # @param application [Application] the application to find clearance courses for.
  # @param college [College] an optional college to limit the courses to.
  # @return [Array<Course>] the course results.
  def self.clearance_courses(application, college=nil)
    scope = Course.available
                .select('DISTINCT courses.*')
                .joins(:college)
                .left_outer_joins(:course_selections)
                .where('colleges.clearance' => true)
                .where('courses.category_id' => Course.select('DISTINCT courses.category_id').joins(:course_selections).where('course_selections.application_id' => application.id))
                .where.not('courses.id' => application.course_selections.select(:course_id))

    # Add college check
    if college
      scope = scope.where('courses.college_id' => college.id)
    end

    scope
  end

  # Gets all courses that meet clearance criteria (e.g. at a college that's in clearance, has +:open+ status, and still
  # has spaces left to fill).
  #
  # @param college [College] optional college to limit results to.
  # @return [Array<Course>] the course results.
  def self.all_clearance_courses(college=nil)
    scope = Course.joins(:college)
                .select('DISTINCT(courses.*)')
                .with_spaces
                .where('courses.status' => :open)
                .where('colleges.clearance' => true)

    if college
      scope = scope.where('courses.college_id' => college.id)
    end

    scope
  end

  # Daily task that checks for the start of a new academic year and resets counter caches.
  def self.process_start_of_new_academic_year
    # Check this is first day of academic year
    if Application.current_year.first == Date.today
      puts 'Detected start of new academic year, resetting counter caches...'

      # Reset all current_selections_count counter caches to zero.
      Course.all.each do |course|
        course.current_selections_count = 0
        course.save!
      end
    end
  end

  # Converts the college data into a spreadsheet that can be downloaded by the user.
  #
  # @param year [Fixnum] the year of data to include in the spreadsheet.
  # @return [Spreadsheet]
  def to_spreadsheet(year=Date.today.year)
    CourseSpreadsheet.generate self, year
  end

  private
    # Checks that a staff member doesn't try to change spaces to be a number
    # less than the current number of applicants.
    def spaces_greater_than_applicants
      if self.spaces < self.current_selections_count
        self.errors.add(:spaces, 'cannot be less than number of applicants')
      end
    end
end