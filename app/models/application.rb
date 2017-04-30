# Name: Alex McBride
# Date: 28/04/2017
# Project: Future Prospects
# Class: Application - model class for a student application.
class Application < ApplicationRecord
  # Imports
  include ActionView::Helpers::TextHelper

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

  # The number of days until a payment expires.
  PAYMENT_EXPIRY_DAYS = 7

  # Enums for student gender.
  enum gender: [:male, :female, :other]

  # Enum for the application status.
  enum status: [:submitting, :submitted, :paid, :payment_failed, :completed, :cancelled]

  # Enum for current application stage.
  enum current_stage: [:intro_stage, :profile_stage, :education_stage, :employment_stage, :references_stage,
                      :statement_stage, :courses_stage, :submit_stage]

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
  validates :permanent_city, presence: true, length: { maximum: 35 }
  validates :permanent_postcode, presence: true, length: { maximum: 35 }
  validates :permanent_country, presence: true, length: { maximum: 35 }
  validates :correspondence_house_number, presence: false, length: { maximum: 12 }
  validates :correspondence_address_1, presence: false, length: { maximum: 35 }
  validates :correspondence_address_2, presence: false, length: { maximum: 35 }
  validates :correspondence_city, presence: false, length: { maximum: 35 }
  validates :correspondence_postcode, presence: false, length: { maximum: 8 }
  validates :correspondence_country, presence: false, length: { maximum: 35 }
  validates :status, presence: true
  validates :submitted_date, presence: false
  validates :current_stage, presence: true

  # Validations shared between application and student.
  include StudentValidator

  # Foreign Keys
  belongs_to :student
  has_many :schools
  has_many :jobs
  has_one :reference
  has_many :course_selections
  has_many :payments

  # Creates a new application based on existing student.
  #
  # * +student+ - the existing student.
  #
  # Returns - the new application.
  def self.create_for_student(student)
    application = Application.new
    application.email = student.email
    application.first_name = student.first_name
    application.family_name = student.family_name
    application.scottish_candidate_number = student.scottish_candidate_number
    application.national_insurance_number = student.national_insurance_number
    application.status = :submitting
    application.current_stage = :intro_stage
    application.student = student
    application.save validate: false # Can't validate at this point
    application
  end

  # Checks if the application is owned by this student
  #
  # * +student+ - the student to check against.
  #
  # Returns - true if the application is owned by the student.
  def owned_by?(student)
    student.id == self.student_id
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

  def self.stage_complete?(stage, current)
    current = Application.current_stages[current]
    stage = Application.current_stages[stage]
    stage > current
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

  # Gets the expiry time of the first failed payment made on this application. This is used to determine when the an
  # application with a failed payment gets cancelled.
  #
  # Returns - the expiry datetime, or nil if there are no failed payments.
  def payment_expiry_time
    payment = Payment.where(status: :failed).order(:created_at).first
    unless payment.nil?
      return payment.created_at + PAYMENT_EXPIRY_DAYS.days
    end
    nil
  end

  # Method called by rake task that cancels any applications with an outstanding payment over 7 days old. To run this
  # you can do it manually `ruby bin\\rake site_tasks:handle_failed_payments`, on Heroku it is run by the scheduler once
  # every 24 hours. See for more details: https://devcenter.heroku.com/articles/scheduler
  def self.handle_failed_payments
    applications = Application.includes(:student)
                       .where(status: :payment_failed)
                       .where(id: Payment.where(status: :failed).where("created_at < CURRENT_DATE - INTERVAL '#{PAYMENT_EXPIRY_DAYS} days'"))

    # Cancel application and emails student.
    applications.each do |application|
      application.cancel
      StudentMailer.application_cancelled(application.student, application)
    end
  end

  # Cancels this application by setting status to :cancelled.
  def cancel
    self.update_status :cancelled
  end

  # Updates the status and saves the application.
  #
  # * +status+ - the new status to set.
  def update_status(status)
    self.status = status
    self.save! validate: false
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

  # Generates a PayPal payment URL with the specified params.
  #
  # * +ip+ - the buyer's IP address
  # * +return_url+ - the URL the buyer is returned to. This return action then needs to call authorize.
  # * +cancel_url+ - the URL the buyer is returned to, if they cancel their PayPal purchase.
  #
  # Returns - the PayPal URL to direct to the buyer to.
  def generate_paypal_url(ip, return_url, cancel_url)
    payment = create_payment_obj
    payment.generate_paypal_url ip, return_url, cancel_url
  end

  # Creates a payment object, of the specified payment type
  #
  # * +payment_type+ - the payment type (:credit_card or :paypal)
  # * +paypal_token+ - the token provided by PayPal, required by PayPal payments.
  def create_payment(payment_type, paypal_token)
    payment = create_payment_obj
    payment.payment_type = payment_type
    payment.update_from_paypal paypal_token
    payment
  end

  # Authorizes payment.
  #
  # * +params+ - the payment params from the payment form
  # * +remote_up+ - the buyer's IP, needed for PayPal.
  #
  # Returns - the payment object.
  def authorize_payment(params, remote_ip)
    payment = create_payment_obj(params)
    payment.remote_ip = remote_ip
    payment.application = self

    if payment.valid?
      if payment.authorize
        update_status :paid
        StudentMailer.payment_received(self.student, @payment).deliver_later
      else
        update_status :payment_failed
        StudentMailer.payment_failed(self.student, @payment).deliver_later
      end
    end

    payment
  end

  # Attempts to save the intro stage.
  #
  # Returns - boolean indicating if the stage was saved.
  def save_intro
    self.current_stage = :profile_stage
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
      self.current_stage = :education_stage
      self.save
      return true
    end
    false
  end

  # Attempts to save the education stage.
  #
  # Returns - boolean indicating if the stage was saved.
  def save_education
    if self.schools_valid?
      self.current_stage = :employment_stage
      self.save validate: false
      return true
    end
    false
  end

  # Attempts to save the employment stage.
  #
  # Returns - boolean indicating if the stage was saved.
  def save_employment
    self.current_stage = :references_stage
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
      self.current_stage = :statement_stage
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
        self.current_stage = :courses_stage
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
    self.current_stage = :submit_stage
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

    if self.submitting? and self.submit_stage?
      self.status = :submitted
      self.submitted_date = DateTime.now
      self.save

      # Send mass email for cancellation
      # TODO: add this is background queue?
      StudentMailer.application_submitted(student, self).deliver_later

      true
    else
      self.errors.add(:section, "'#{self.current_stage.humanize}' has not been completed")
      false
    end
  end

  private
    # Creates payment object with valid attributes
    #
    # * +params+ - the request params
    #
    # Returns - the created payment object.
    def create_payment_obj(params={})
      payment = Payment.new params
      payment.application = @application
      payment.amount = calculate_fee
      payment.description = "Application fee (#{pluralize course_selections_count, 'course'})"
      payment
    end
end
