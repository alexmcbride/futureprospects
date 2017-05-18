# Model class for a CourseSelection. Stores the courses associated with a particular application.
class CourseSelection < ApplicationRecord
  include ActionView::Helpers::TextHelper

  # Enums
  enum college_offer: [:rejected, :conditional_offer, :definite_offer]
  enum student_choice: [:firm_choice, :insurance_choice, :declined, :skipped]

  # Validators
  validates :application_id, presence: true
  validates :course_id, presence: true
  validate :course_is_unique, on: :create
  validate :course_is_open, on: :create
  validate :course_is_not_full, on: :create
  validate :can_add_course_to_application, on: :create
  validates :note, presence: true, if: :rejected? || :conditional_offer?

  # Associations
  belongs_to :application, counter_cache: true
  belongs_to :course, counter_cache: true

  # Scopes
  scope :successful, -> {completed.where(college_offer: [:conditional_offer, :definite_offer], student_choice: [:firm_choice, :insurance_choice])}
  scope :ordered, -> {order(:college_offer)}
  scope :completed, -> {joins(:application).where('applications.status' => :completed)}
  scope :schools, ->{joins(application: :schools)}
  scope :jobs, ->{joins(application: :jobs)}
  scope :current, ->{joins(:application).where('applications.created_at' => Application.current_year)}
  scope :college, ->(college_id){joins(:course).where('courses.college_id' => college_id)}

  # Callbacks.
  after_create :increase_current_selections_count
  after_destroy :decrease_current_selections_count

  # Checks if a course selection already exists.
  #
  # Returns a boolean indicating if the selection exists.
  def exists?
    CourseSelection.exists? self.application_id, self.course_id
  end

  def self.exists?(application_id, course_id)
    not CourseSelection.where('application_id=? AND course_id=?', application_id, course_id).empty?
  end

  # Gets the colleges that the application has applied to.
  #
  # * +application+ - the application to find colleges for.
  #
  # Returns ActiveRecord::Relation.
  def self.selected_colleges(application)
    application.course_selections
        .select('DISTINCT (colleges.*)')
        .joins(course: :college)
        .where(student_choice: [:firm_choice, :insurance_choice])
  end

  # Determines if the student has made all their choices.
  #
  # Returns boolean true if they do have all choices.
  def has_all_choices?
    self.application.course_selections.all? {|s| s.student_choice.present? || s.rejected?}
  end

  # Updates course selection for firm_choice
  #
  # Returns true if the student has made all their choices
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
  # * +application+ - the application to clear choices for.
  def self.clear_all_choices(application)
    application.course_selections.each do |selection|
      selection.student_choice = :skipped # So we can differentiate from nil.
      selection.save!
    end
  end

  # Declines choices on an application.
  #
  # * +which+ - which offer to decline (either :all or :insurance)
  # * +application+ - the application to decline the offers for.
  def self.decline(which, application)
    if which == :all
      decline_all application
    elsif which == :insurance
      decline_insurance application
    end
  end

  def self.update_all_student_choices(application, choice)
    CourseSelection.where(application_id: application.id).each do |selection|
      selection.student_choice = choice
      selection.save
    end
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
    # TODO: is this needed, I don't think CourseSelections can be destroyed?
    def decrease_current_selections_count
      self.course.current_selections_count -= 1
      self.course.save validate: false
    end

    # Declines all of a student's choices.
    #
    # * +application+ - the application to decline choices for.
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
    # * +application+ - the application to decline for.
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
      if self.course.full?
        self.errors.add(:course, 'is full')
      end
    end
end
