# * Name: Alex McBride
# * Date: 24/05/2017
# * Project: Future Prospects
# * Model class for a CourseSelection. Stores the courses associated with a particular application.
class CourseSelection < ApplicationRecord
  include ActionView::Helpers::TextHelper

  # @!attribute college_offer
  #   @return [symbol]
  #   Enum for college offers or decisions.
  #
  #   * +:rejected+ - the application has been rejected.
  #   * +:conditional_offer+ - the application has a conditional offer.
  #   * +:definite_offer+ - the application has a definite offer.
  enum college_offer: [:rejected, :conditional_offer, :definite_offer]

  # @!attribute student_choice
  #   @return [symbol]
  #   Enum for student choices or replies.
  #
  #   * +:firm_choice+ - the student has made this their firm choice.
  #   * +:insurance_choice+ - the student has made this their insurance choice.
  #   * +:declined+ - the student has declined this offer.
  #   * +:skipped+ - the student's choice was not asked for (e.g. the college rejected the application).
  enum student_choice: [:firm_choice, :insurance_choice, :declined, :skipped]

  # Validators
  validates :application_id, presence: true
  validates :course_id, presence: true
  validate :course_is_unique, on: :create
  validate :course_is_open, on: :create
  validate :course_is_not_full, on: :create
  validate :can_add_course_to_application, on: :create
  validates :note, presence: true, if: :rejected? || :conditional_offer?

  # @!attribute application_id
  #   @return [Integer]
  #   The application ID part of the composite key.

  # @!attribute course_id
  #   @return [Integer]
  #   The course ID part of the composite key.

  # @!attribute created_at
  #   @return [DateTime]
  #   The creation date.

  # @!attribute updated_at
  #   @return [DateTime]
  #   The last update time.

  # @!attribute note
  #   @return [String]
  #   The note left on the course selection by a staff member.

  # @!attribute application
  #   @return [Application]
  #   The application the course selection belongs to.
  belongs_to :application, counter_cache: true

  # @!attribute course
  #   @return [Course]
  #   The course the course selection belongs to.
  belongs_to :course, counter_cache: true

  # Finds courses selections that are successful (e.g. where the college made an offer and the student accepted it).
  #
  # @return [Array<CourseSelection>]
  scope :successful, -> { completed.where(college_offer: [:conditional_offer, :definite_offer], student_choice: [:firm_choice, :insurance_choice]) }

  # Scope to order course selections by college_offer (so nice ones with offers appear at the top)
  #
  # @return [Array<CourseSelection>]
  scope :ordered, -> { order(:college_offer) }

  # Finds courses selections that have a status of +:completed+.
  #
  # @return [Array<CourseSelection>]
  scope :completed, -> { joins(:application).where('applications.status' => :completed) }

  # Scope to join course_selections with schools.
  #
  # @return [Array<CourseSelection>]
  scope :schools, ->{ joins(application: :schools) }

  # Scope to join course_selections with jobs.
  #
  # @return [Array<CourseSelection>]
  scope :jobs, -> { joins(application: :jobs) }

  # Scope to find course selections only in the specified year.
  #
  # @param year [Integer]
  # @return [Array<CourseSelection>]
  scope :current, -> (year=nil) { joins(:application).where('applications.created_at' => Application.current_year(year)) }

  # Scope to find course_selections for courses at the specified college.
  #
  # @param college_id [Integer]
  # @return [Array<CourseSelection>]
  scope :college, -> (college_id) { joins(:course).where('courses.college_id' => college_id) }

  # Scope to find course_selections for the specified course.
  #
  # @param course_id [Integer]
  # @return [Array<CourseSelection>]
  scope :course, -> (course_id) { where(course_id: course_id) }

  # Scope to find course_selections for the specified course grouped by year.
  #
  # @param course_id [Integer]
  # @return [Array<CourseSelection>]
  scope :years, -> (course_id) { joins(:course, :application).where(course_id: course_id).group_by_year('applications.created_at', reverse: true) }

  # Scope for finding course selections with the specified college and year.
  #
  # @param college_id [Integer]
  # @param year [Integer]
  # @return [Array<CourseSelection>]
  scope :report_current_college, -> (college_id, year=nil) { current(year).college(college_id).successful }

  # Scope for finding course selections with the specified college and year grouped by college offer.
  #
  # @param college_id [Integer]
  # @param year [Integer]
  # @return [Array<CourseSelection>]
  scope :report_college_offers, -> (college_id, year=nil) { current(year).college(college_id).group(:college_offer).order(:college_offer).count.map {|k, v| [ k ? k.titleize : 'Pending', v]} }

  # Scope for finding course selections with the specified college and year grouped by student choice.
  #
  # @param college_id [Integer]
  # @param year [Integer]
  # @return [Array<CourseSelection>]
  scope :report_college_choices, -> (college_id, year=nil) { current(year).college(college_id).group(:student_choice).order(:student_choice).count.map {|k, v| [ k ? k.titleize : 'Pending', v] if k != 'skipped'}.compact }

  # Scope for finding course selections with the specified college and year grouped by course.
  #
  # @param college_id [Integer]
  # @param year [Integer]
  # @return [Array<CourseSelection>]
  scope :report_courses, -> (college_id, year=nil) { current(year).college(college_id).group('courses.title', 'courses.id').limit(10).order('count_id DESC').count('id') }

  # Scope for finding course selections with the specified course and year grouped by college offer.
  #
  # @param college_id [Integer]
  # @param year [Integer]
  # @return [Array<CourseSelection>]
  scope :report_course_offers, -> (course_id, year=nil){current(year).course(course_id).group(:college_offer).order(:college_offer).count.map{|k,v| [k ? k.titleize : 'Pending',v]}.compact}

  # Scope for finding course selections with the specified course and year grouped by student choice.
  #
  # @param college_id [Integer]
  # @param year [Integer]
  # @return [Array<CourseSelection>]
  scope :report_course_choices, -> (course_id, year=nil) { current(year).course(course_id).group(:student_choice).order(:student_choice).count.map{|k,v| [k ? k.titleize : 'Pending',v] if k != 'skipped'}.compact}

  # Scope for finding course selections with the specified course and year grouped by school.
  #
  # @param college_id [Integer]
  # @param year [Integer]
  # @return [Array<CourseSelection>]
  scope :report_course_schools, ->(course_id, year=nil) {current(year).course(course_id).schools.group('schools.name').order('schools.name').count}

  # Callbacks.
  after_create :increase_current_selections_count
  after_destroy :decrease_current_selections_count

  # Checks if a course selection already exists.
  #
  # @return [Boolean]
  def exists?
    CourseSelection.exists? self.application_id, self.course_id
  end

  # Checks if a particular course selection already exists.
  #
  # @param application_id [Integer]
  # @param course_id [Integer]
  # @return [Boolean]
  def self.exists?(application_id, course_id)
    CourseSelection.where('application_id=? AND course_id=?', application_id, course_id).any?
  end

  # Gets the colleges that the application has applied to.
  #
  # @param application [Application] the application to find colleges for.
  # @return [Array<College>]
  def self.selected_colleges(application)
    application.course_selections
        .select('DISTINCT (colleges.*)')
        .joins(course: :college)
        .where(student_choice: [:firm_choice, :insurance_choice])
  end

  # Determines if the student has made all their choices.
  #
  # @return [Boolean] true if they have made all their choices.
  def has_all_choices?
    self.application.course_selections.all? {|s| (s.student_choice.present? && !s.skipped?) || s.rejected?}
  end

  # Updates course selection for firm choice
  #
  # @return [Boolean] true if the student has made all their choices
  def make_firm_choice
    self.student_choice = :firm_choice
    save!
    has_all_choices?
  end

  # Updates course selection for insurance choice.
  def make_insurance_choice
    self.student_choice = :insurance_choice
    save!
    CourseSelection.decline_all(self.application)
  end

  # Clears all of a student's choices.
  #
  # @param application [Application] the application to clear choices for.
  def self.clear_all_choices(application)
    application.course_selections.each do |selection|
      selection.student_choice = :skipped # So we can tell a selection with no choice from one that was never asked.
      selection.save!
    end
  end

  # Declines student choices on an application.
  #
  # @param which [Symbol] which choice to decline (either +:all+ or +:insurance+).
  # @param application [Application] the application to decline the offers for.
  def self.decline(which, application)
    if which == :all
      decline_all application
    elsif which == :insurance
      decline_insurance application
    end
  end

  # Updates all student choices in the specified application to the same choice.
  #
  # @param application [Application] the application to update.
  # @param choice [Symbol] the choice to update it to.
  def self.update_all_student_choices(application, choice)
    CourseSelection.where(application_id: application.id).each do |selection|
      selection.student_choice = choice
      selection.save
    end
  end

  # Gets pretty college offer text.
  #
  # @return [String]
  def college_offer_text
    self.college_offer ? self.college_offer.titleize : 'Pending'
  end

  # Gets pretty student choice text.
  #
  # @return [String]
  def student_choice_text
    self.student_choice ? self.skipped? ? 'None' : self.student_choice.titleize : 'Pending'
  end

  private
    # Callback to auto-increase course_selections count for current year
    def increase_current_selections_count
      if self.application.current_year?
        self.course.current_selections_count += 1
        self.course.save validate: false
      end
    end

    # Callback to auto-decrease course_selections count for current year.
    def decrease_current_selections_count
      if self.application.current_year?
        self.course.current_selections_count -= 1
        self.course.save validate: false
      end
    end

    # Declines all of a student's choices.
    #
    # @param application [Application] the application to decline choices for.
    def self.decline_all(application)
      application.course_selections.each do |selection|
        unless selection.firm_choice? or selection.insurance_choice?
          selection.student_choice = :declined
          selection.save!
        end
      end
    end

    # Declines student's insurance choice.
    #
    # @param application [Application] the application to decline for.
    def self.decline_insurance(application)
      application.course_selections.each do |selection|
        unless selection.firm_choice?
          selection.student_choice = :declined
          selection.save!
        end
      end
    end

    # Adds a validation error if the course selection is not unique.
    def course_is_unique
      if CourseSelection.exists? self.application_id, self.course_id
        self.errors.add(:course, 'has already been added to the application')
      end
    end

    # Adds a validation error if the course does not have a open status.
    def course_is_open
      if self.course
        unless self.course.open?
          self.errors.add(:course, "cannot be added as its marked as '#{self.course.status}'")
        end
      end
    end

    # Adds a validation error if the application already has max number courses added.
    def can_add_course_to_application
      unless self.application.can_add_course?
        self.errors.add(:maximum, "of #{pluralize Application::MAX_COURSES, 'course'} has been reached")
      end
    end

    # Adds a validation error if the course is full.
    def course_is_not_full
      if self.course && self.course.full?
        self.errors.add(:course, 'is full')
      end
    end
end
