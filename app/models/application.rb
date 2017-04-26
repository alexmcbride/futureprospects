# Model for a student application.
class Application < ApplicationRecord
  # The maximum length of a personal statement.
  STATEMENT_LENGTH = 2000

  # The maximum number of allowed courses.
  MAX_COURSES = 5

  # The cost of a single course.
  SINGLE_COURSE_FEE = 1000 # Amounts are in pence.

  # The cost of multiple courses.
  MULTIPLE_COURSE_FEE = 2000

  # Used for converting pence into pounds.
  PENCE_IN_POUND = 100

  # Enums for student gender.
  #
  # * +:male+ - Student is male
  # * +:female+ - Student is female
  # * +:other+ - Student is LGBT or prefer not to say
  enum gender: [:male, :female, :other]

  # Enum for the application status.
  #
  # * +:applying+ -  Student is still applying.
  # * +:submitted+ -  Application has been submitted.
  # * +:paid+ -  Application payment has been processed successfully.
  # * +:completed - Application has been completed
  enum status: [:submitting, :submitted, :paid, :payment_failed, :completed, :cancelled]

  # Enum for the payment type.
  #
  # * +:credit_card+ -  Paid by credit card
  # * +:paypal+ -  Paid by PayPal
  enum payment_type: [:credit_card, :paypal]

  # Validators
  validates :title, presence: true, length: { maximum: 35 }
  validates :first_name, presence: true, length: { maximum: 35 }
  validates :middle_name, presence: false, length: { maximum: 30 }
  validates :family_name, presence: true, length: { maximum: 35 }
  validates :previous_name, presence: false, length: { maximum: 70 }
  validates :gender, presence: true
  validates :telephone, presence: true, length: { maximum: 20 }
  validates :mobile, presence: false, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 254 }
  validates :disability, presence: false, length: { maximum: 100 }
  validates :personal_statement, presence: false, length: { maximum: STATEMENT_LENGTH }
  validates :permanent_house_number, presence: true, length: { maximum: 12 }
  validates :permanent_address_1, presence: true, length: { maximum: 35 }
  validates :permanent_address_2, presence: false, length: { maximum: 35 }
  validates :permanent_postcode, presence: true, length: { maximum: 8 }
  validates :permanent_country, presence: true, length: { maximum: 35 }
  validates :correspondence_house_number, presence: false, length: { maximum: 12 }
  validates :correspondence_address_1, presence: false, length: { maximum: 35 }
  validates :correspondence_address_2, presence: false, length: { maximum: 35 }
  validates :correspondence_postcode, presence: false, length: { maximum: 8 }
  validates :correspondence_country, presence: false, length: { maximum: 35 }
  validates :status, presence: true
  validates :submitted_date, presence: false
  validates :payment_amount, presence: false
  validates :payment_type, presence: false
  validates :payment_date, presence: false

  # Validations shared between application and student.
  include StudentValidator

  # Foreign Keys
  belongs_to :student
  has_many :schools
  has_many :jobs
  has_one :reference
  has_many :course_selections
  has_many :payments

  # Checks if the application is owned by this student
  #
  # * +student+ - the student to check against.
  #
  # Returns - true if the application is owned by the student.
  def owned_by?(student)
    student.id == self.student_id
  end

  # Checks if the application is complete.
  #
  # Returns - true if all stages are complete.
  def complete?
    self.incomplete_stages.empty?
  end

  # Checks if the application is incomplete.
  #
  # Returns - true if all stages are incomplete.
  def incomplete?
    not complete?
  end

  # Gets a symbol indicating the first uncompleted stage of the application.
  #
  # Returns - a symbol indicating the first incomplete stage.
  def first_incomplete_stage
    stage = self.incomplete_stages.first
    stage.nil? ? :submit : stage
  end

  # Gets an array of incomplete stages in the application.
  #
  # Returns - an array of symbols.
  def incomplete_stages
    stages = {intro: self.completed_intro,
              profile: self.completed_profile,
              education: self.completed_education,
              employment: self.completed_employment,
              referneces: self.completed_references,
              statement: self.completed_statement,
              courses: self.completed_courses}
    (stages.map { |k, v| k unless v }).compact
  end

  # Finds all of this applications course selections.
  #
  # Returns - ActiveRecord::Relation with course selections.
  def find_course_selections
    CourseSelection.includes(:course).where application_id: self.id
  end

  # Checks that all added schools have at least one qualification.
  #
  # Returns - true if the schools are valid.
  def schools_valid?
    valid = true
    self.schools.each do |school|
      unless school.qualifications_valid?
        self.errors.add(:school, "'#{school.name}' does not have any qualifications")
        valid = false
      end
    end
    valid
  end

  # Calculates the number of courses the student can still add.
  #
  # Returns - integer
  def available_courses
    MAX_COURSES - self.course_selections_count
  end

  # Checks if a student can still add courses to their application.
  #
  # Returns - true if can add courses.
  def can_add_course?
    self.available_courses > 0
  end

  # Calculates the student's application fee.
  #
  # Returns - the application fee amount in pence.
  def calculate_fee
    Application::courses_fee(course_selections_count > 1 ? :multiple : :single)
  end

  # Calculates the student's application fee.
  #
  # Returns - the application fee amount in pounds.
  def calculate_fee_pounds
    calculate_fee / PENCE_IN_POUND
  end

  # Gets the course fee for the submission type (e.g. :single or :multiple)
  #
  # * +type+ - :single or :multiple
  #
  # Returns - the course fee in pence.
  def self.courses_fee(type)
    if type == :single
      SINGLE_COURSE_FEE
    elsif type == :multiple
      MULTIPLE_COURSE_FEE
    else
      0
    end
  end

  # Gets the course fee for the submission type (e.g. :single or :multiple)
  #
  # * +type+ - :single or :multiple
  #
  # Returns - the course fee in pounds.
  def self.courses_fee_pounds(type)
    courses_fee(type) / PENCE_IN_POUND
  end

  # Cancelled if no authorized and has failed payment over 7 days old.
  #
  # Returns - true if a payment has expired, failed otherwise.
  def cancelled?
    expired = false
    self.payments.each do |payment|
      if payment.authorized?
        return false # If a payment was authorized then it's not expired.
      end
      if payment.has_expired?
        expired = true
      end
    end
    expired
  end

  def expiry_time
    payment = Payment.where(status: :failed).order(:created_at).first
    payment.expiry_time unless payment.nil?
  end

  # Adds a course selection to the application.
  #
  # * +selection+ - The selection to add.
  #
  # Returns: a boolean indicating if the selection was added or not.
  def add_course(selection)
    selection.application = self
    if selection.valid?
      return selection.save
    end
    false
  end

  # Attempts to save the education stage.
  #
  # Returns - boolean indicating if the stage was saved.
  def save_education
    if self.schools_valid?
      self.completed_education = true
      self.save validate: false
      return true
    end
    false
  end

  # Attempts to save the intro stage.
  #
  # Returns - boolean indicating if the stage was saved.
  def save_intro
    self.completed_intro = true
    self.save validate: false
    true
  end

  # Attempts to save the profile stage.
  #
  # * +params+ - the request params containing profile data.
  #
  # Returns - boolean indicating if the stage was saved.
  def save_profile(params)
    self.attributes = params
    self.status = :submitting
    if self.valid?
      self.completed_profile = true
      self.save
      return true
    end
    false
  end

  # Attempts to save the employment stage.
  #
  # Returns - boolean indicating if the stage was saved.
  def save_employment
    self.completed_employment = true
    self.save
    true
  end

  # Retrieve reference or create new one as needed.
  #
  # Returns - the reference.
  def create_reference
    self.reference or Reference.new
  end

  # Attempts to save updated references stage.
  #
  # * +reference+ - the reference object to add or update.
  # * +params+ - the request params containing reference data.
  #
  # Returns - boolean indicating if the stage was saved.
  def save_references(reference, params)
    reference.attributes = params
    if reference.valid?
      self.completed_references = true
      self.reference = reference
      self.save
      return true
    end
    false
  end

  # Attempt to save the personal statement stage.
  #
  # * +params+ - the request params containing statement data.
  #
  # Returns - boolean indicating if the stage was saved.
  def save_statement(params)
    self.attributes = params
    if self.personal_statement.empty? or self.personal_statement.length == 0
      self.errors.add(:personal_statement, "can't be blank")
    else
      if self.valid?
        self.completed_statement = true
        self.save
        return true
      end
    end
    false
  end

  # Attempts to save the course selection.
  #
  # Returns - boolean indicating if the stage was saved.
  def save_courses
    if self.course_selections.empty?
      self.errors.add(:saving, 'requires that you must apply for at least one course')
      return false
    end
    self.completed_courses = true
    self.save validate: false # don't want to worry about rest of application here.
  end

  # Attempts to submit the application.
  #
  # * +confirmed+ - a boolean indicating if the student has confirmed the submission.
  #
  # Returns - boolean indicating if the stage was saved.
  def save_submit(confirmed)
    unless confirmed
      self.errors.add(:confirm, 'box must be checked in order to submit.')
      return false
    end

    stages = self.incomplete_stages
    if stages.empty?
      self.status = :submitted
      self.submitted_date = DateTime.now
      self.save

      # Send mass email for cancellation
      # TODO: add this is background queue
      StudentMailer.application_submitted(student, self).deliver_later

      true
    else
      stages.each {|s| self.errors.add(s, 'section has not been completed')}
      false
    end
  end
end
