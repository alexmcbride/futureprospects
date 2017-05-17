# * Name: Alex McBride
# * Date: 17/05/2017
# * Project: Future Prospects
# * Application model class for a student application.
class Application < ApplicationRecord
  # Imports
  include ActionView::Helpers::TextHelper

  # The maximum length of a personal statement.
  STATEMENT_LENGTH = 2000

  # The maximum number of allowed courses.
  MAX_COURSES = 5

  # The cost of a single course in pence. Note: all monetary values are stored in pence.
  SINGLE_COURSE_FEE = 1000

  # The cost of multiple courses in pence.
  MULTIPLE_COURSE_FEE = 2000

  # Cost of changing courses in pence.
  COURSE_CHANGE_FEE = 1000

  # Used for converting pence into pounds.
  PENCE_IN_POUND = 100

  # The number of days until a payment expires.
  PAYMENT_EXPIRY_DAYS = 7

  # @!attribute gender
  #   @return [symbol]
  #   Enum for student gender.
  #
  #   * +:male+ - the student is male.
  #   * +:female+ - the student is female.
  #   * +:other+ - the student has a non-binary gender.
  #   * +:prefer_not_to_say+ - the student would prefer not to say.
  enum gender: [:male, :female, :other, :prefer_not_to_say]

  # @!attribute status
  #   @return [symbol]
  #   Enum for application status.
  #
  #   * +:submitting+ - Student filling in application
  #   * +:awaiting_payment+ - Application submitted, awaiting payment
  #   * +:payment_failed+ - Payment failed, still within 7 days
  #   * +:cancelled+ - Payment failed, outwith 7 days
  #   * +:awaiting_decisions+ - Payment received, waiting for colleges
  #   * +:all_rejected+ - Decisions in, all rejected (eligible for clearance)
  #   * +:awaiting_replies+ - Decisions in, waiting for students
  #   * +:replies_overdue+ - Student hasn't replied within allotted time
  #   * +:clearance+ - Student offered clearance courses
  #   * +:completed+ - Decisions made, replies received, finished.
  enum status: [:submitting,
                :awaiting_payment,
                :payment_failed,
                :cancelled,
                :awaiting_decisions,
                :all_rejected,
                :awaiting_replies,
                :replies_overdue,
                :clearance,
                :completed
  ]

  # @!attribute current_stage
  #   @return [symbol]
  #   Enum for the current application stage.
  #   * +:intro_stage+ - Student is on the introduction stage.
  #   * +:profile_stage+ - Student is on the profile stage.
  #   * +:education_stage+ - Student is on the education stage.
  #   * +:employment_stage+ - Student is on the employment stage.
  #   * +:references_stage+ - Student is on the references stage.
  #   * +:statement_stage+ - Student is on the statement stage.
  #   * +:courses_stage+ - Student is on the courses stage.
  #   * +:submit_stage+ - Student is on the submit stage.
  enum current_stage: [:intro_stage, :profile_stage, :education_stage, :employment_stage, :references_stage,
                       :statement_stage, :courses_stage, :submit_stage]

  # Default number of applications per page of pagination (for will_paginate)
  self.per_page = 15

  ##
  # Finds all applications with :awaiting_decisions status.
  scope :awaiting, -> {where(status: :awaiting_decisions)}

  ##
  # Finds all applications with :submitting status.
  scope :submitting, -> {where(status: :submitting)}

  ##
  # Finds all applications created during the current academic year.
  scope :current, -> {where(created_at: current_year)}

  ##
  # Finds all applications created before the current academic year.
  scope :old, -> {where('created_at<=?', current_year.first)}

  ##
  # Finds all applications from a specific college.
  #
  # * +college_id+ - the ID of the college to filter applications by.
  scope :college, ->(college_id){select('DISTINCT applications.*').joins(course_selections: :course).where('courses.college_id' => college_id)}

  ##
  # Finds all applications that were created the specified year.
  #
  # * +year+ - year to limit scope to.
  scope :by_year, ->(year) do
    year = year.to_i # Returns zero if int does not parse
    year.nil? || year == 0 ? current : where(created_at: Date.new(year, 1, 1)..Date.new(year, 12, 31))
  end

  # Validators
  validates :title, presence: true, length: { maximum: 35 }
  validates :first_name, presence: true, length: { maximum: 35 }
  validates :middle_name, presence: false, length: { maximum: 30 }
  validates :family_name, presence: true, length: { maximum: 35 }
  validates :previous_name, presence: false, length: { maximum: 70 }
  validates :gender, presence: true
  validates :telephone, presence: true, length: { maximum: 20 }
  validates :mobile, presence: false, length: { maximum: 20 }
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
  validate :applications_are_open, on: :create

  # Associations.
  belongs_to :student
  has_many :schools
  has_many :jobs
  has_one :reference
  has_many :course_selections
  has_many :payments

  # Callbacks.
  before_save :update_for_awaiting_decisions, on: :update # Detects when all colleges have made their decisions.

  # Allows support of nested forms for the course offers form.
  accepts_nested_attributes_for :course_selections, reject_if:  lambda {|attr| attr[:college_offer].blank?}

  # Creates a new application based on existing student.
  #
  # * +student+ - the existing student.
  #
  # @return [Application]
  def self.create_for_student(student)
    application = Application.new
    application.first_name = student.first_name
    application.family_name = student.family_name
    application.status = :submitting
    application.current_stage = :intro_stage
    application.student = student
    application.save validate: false # Can't validate at this point
    application
  end

  # Determines if this application is for the current academic year.
  #
  # @return [boolean]
  def current_year?
    Application.current_year.include? self.created_at
  end

  # Determines the date range of the current academic year
  #
  # * +year+ - an optional year (fixnum) to find the academic year for (e.g. 2016)
  #
  # @return [Date..Date]
  def self.current_year(year=nil)
    year = Date.today.year unless year
    (Date.new(year, 1, 1)..Date.new(year, 7, 16))
  end

  # Gets the student's full name. This is not always present, you should prefer Student.full_name which is guaranteed
  # to be set.
  #
  # @return [string]
  def full_name
    "#{first_name} #{family_name}"
  end

  # Checks if the application is owned by this student
  #
  # * +student+ - the student to check against.
  #
  # @return [boolean]
  def owned_by?(student)
    student.id == self.student_id
  end

  # Checks if this applications has a course selection for the specified college.
  #
  # * +college_id+ - the college to check for.
  #
  # @return [boolean]
  def belongs_to_college(college_id)
    self.course_selections.joins(:course).where('courses.college_id=?', college_id).any?
  end

  # Finds an array of application IDs that are still waiting on offers from other colleges. This is an optimisation to
  # prevent having to perform the lookup for every application in a loop.
  #
  # * +college_id+ - the ID of the college to look for applications. If this is nil then an empty array is returned.
  #
  # @return [array[fixnum]]
  def self.awaiting_other_colleges(college_id)
    if college_id.nil?
      return []
    end

    # Find all applications that are marked awaiting_decisions but that have no NULL offers at this college.
    Application.select('applications.id')
        .joins(course_selections: :course)
        .where('applications.status' => :awaiting_decisions)
        .where('courses.college_id=?', college_id)
        .where.not('course_selections.college_offer' => nil).map {|s| s.id}
  end

  # Determines if the application is waiting on this college.
  #
  # * +college+ - the college to check for.
  #
  # @return [boolean]
  def awaiting_college?(college)
    self.course_selections.joins(:course).where('courses.college_id' => college.id, college_offer: nil).any?
  end

  # Determines if this application is waiting on decisions from other colleges.
  #
  # * +college+ - the college to check against.
  #
  # @return [boolean]
  def awaiting_other_colleges?(college)
    if college.nil?
      return false
    end

    college_ids = Course.select('courses.college_id')
        .joins(:course_selections)
        .where('course_selections.application_id' => self.id)
        .where('course_selections.college_offer' => nil).map{|r|r.college_id}

    college_ids.any? && !college_ids.include?(college.id)
  end

  # Checks that all added schools have at least one qualification.
  #
  # @return [boolean]
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

  # Determines if the specified stage is complete.
  #
  # * +stage+ - the stage the application is at.
  # * +current+ - the stage the student is viewing.
  #
  # @return [boolean]
  def self.stage_complete?(stage, current)
    current = Application.current_stages[current]
    stage = Application.current_stages[stage]
    stage > current
  end

  # Calculates the number of courses the student can still add.
  #
  # @return [fixnum]
  def available_courses
    MAX_COURSES - self.course_selections_count
  end

  # Checks if a student can still add courses to their application, which they can either if they have fewer than the
  # max allowed courses, or they are in clearance.
  #
  # @return [boolean]
  def can_add_course?
    self.available_courses > 0 || self.clearance?
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
  # @return [boolean]
  def add_course(selection)
    selection.application = self
    if selection.valid?
      return selection.save
    end
    false
  end

  # Adds clearance course selection.
  #
  # * +selection+ - the course selection to add.
  #
  # @return [boolean]
  def add_clearance_course(selection)
    if add_course selection
      update_status :awaiting_decisions
      StudentMailer.clearance_application(self.student, selection.course).deliver_later
      return true
    end
    false
  end

  # Calculates the student's application fee in pence.
  #
  # @return [fixnum]
  def calculate_fee
    Application::courses_fee(course_selections_count > 1 ? :multiple : :single)
  end

  # Calculates the student's application fee.
  #
  # @return [fixnum]
  def calculate_fee_pounds
    calculate_fee / PENCE_IN_POUND
  end

  # Gets the course fee for the submission type (e.g. :single or :multiple) in pence
  #
  # * +type+ - :single or :multiple
  #
  # @return [fixnum]
  def self.courses_fee(type)
    if type == :single
      SINGLE_COURSE_FEE
    elsif type == :multiple
      MULTIPLE_COURSE_FEE
    else
      0
    end
  end

  # Gets the course fee for the submission type (e.g. :single or :multiple) in pounds
  #
  # * +type+ - :single or :multiple
  #
  # @return [fixnum]
  def self.courses_fee_pounds(type)
    courses_fee(type) / PENCE_IN_POUND
  end

  # Gets the expiry time of the first failed payment made on this application. This is used to determine when the an
  # application with a failed payment gets cancelled. If there are no payments then it returns nil.
  #
  # @return [DateTime]
  def payment_expiry_time
    payment = self.payments.where(status: :failed).order(:paid_at).first
    unless payment.nil?
      return payment.paid_at + PAYMENT_EXPIRY_DAYS.days
    end
    nil
  end

  # Method called by rake task that cancels any applications with an outstanding payment over 7 days old. To run this
  # you can do it manually `ruby bin\rake site_tasks:handle_failed_payments`, on Heroku it is run by the scheduler once
  # every 24 hours. See for more details: https://devcenter.heroku.com/articles/scheduler
  def self.process_failed_payments
    payments = Payment.select(:application_id)
                   .where(status: :failed)
                   .where("paid_at < CURRENT_DATE - INTERVAL '#{PAYMENT_EXPIRY_DAYS} days'")
    applications = Application.current.includes(:student).where(status: :payment_failed).where(id: payments)

    # Cancel application and emails student.
    applications.each do |application|
      application.cancel
      puts "Cancelled application for: #{application.student.username}..."
      StudentMailer.application_cancelled(application.student, application)
    end
  end

  # Task for handling overdue replies, that is course selections that have been without a decision for too long. Called
  # as a rake task once a day.
  def self.process_overdue_replies
    applications = Application.current.where(status: :awaiting_replies).where('CURRENT_DATE>decision_due')

    applications.each do |application|
      application.update_status :replies_overdue
      puts "Cancelled application for: #{application.student.username}..."
      StudentMailer.reply_overdue(application.student, application)
    end
  end

  # Finds all course selections that do not have an offer.
  #
  # @return [ActiveRecord::Relation]
  def pending_course_selections
    self.course_selections.order('college_offer IS NULL', college_offer: :desc)
  end

  # Finds all course selections that do have an offer.
  #
  # @return [ActiveRecord::Relation]
  def course_selections_with_college_offers
    self.course_selections.where.not(college_offer: :rejected).order(:student_choice)
  end

  # Finds all course selections without student choices.
  #
  # @return [ActiveRecord::Relation]
  def course_selections_without_choices
    CourseSelection.where(application_id: self.id)
        .where(student_choice: nil)
        .order(:student_choice)
  end

  # Generates a PayPal payment URL with the specified params.
  #
  # * +ip+ - the buyer's IP address
  # * +return_url+ - the URL the buyer is returned to. This return action then needs to call authorize.
  # * +cancel_url+ - the URL the buyer is returned to, if they cancel their PayPal purchase.
  #
  # @return [string]
  def generate_paypal_url(ip, return_url, cancel_url)
    unpaid_payment.generate_paypal_url ip, return_url, cancel_url
  end

  # Creates a payment object, of the specified payment type
  #
  # * +payment_type+ - the payment type (:credit_card or :paypal)
  # * +paypal_token+ - the token provided by PayPal, required by PayPal payments.
  def update_payment(payment_type, paypal_token)
    payment = self.unpaid_payment
    payment.payment_type = payment_type
    payment.update_from_paypal paypal_token
    payment.save validate: false
    payment
  end

  # Authorizes any unpaid payment object attached to the application.
  #
  # * +params+ - the payment params from the payment form
  # * +remote_up+ - the buyer's IP, needed for PayPal.
  #
  # @return [Payment]
  def authorize_payment(params, remote_ip)
    payment = self.unpaid_payment
    payment.update_attributes params
    payment.remote_ip = remote_ip # Needed for PayPal

    if payment.valid?
      if payment.authorize
        update_status :awaiting_decisions
        StudentMailer.payment_received(self.student, payment).deliver_later
      else
        update_status :payment_failed
        StudentMailer.payment_failed(self.student, payment).deliver_later
      end
    end

    payment
  end

  # Filters applications by params.
  #
  # * +params+ - the params with the filter data
  #
  # @return [ActiveRecord::Relation]
  def self.filter(params)
    scope = Application.all
    unless params[:name].nil? || params[:name].empty?
      scope = scope.where('LOWER(first_name || family_name) LIKE LOWER(?)', "%#{params[:name]}%")
    end
    unless params[:status].nil? or params[:status] == 'all_statuses'
      scope = scope.where(status: params[:status])
    end
    unless params[:college_id].nil? or params[:college_id] == '0'
      scope = scope.college params[:college_id]
    end
    unless params[:category_id].nil? or params[:category_id] == '0'
      scope = scope.joins(course_selections: :course).where('courses.category_id=?', params[:category_id])
    end
    unless params[:order].nil? or params[:order] == 'none'
      scope = scope.order(params[:order])
    end
    scope
  end

  # Attempts to save the intro stage.
  #
  # Returns boolean indicating if the stage was saved.
  def save_intro
    self.current_stage = :profile_stage
    self.save validate: false
    true
  end

  # Attempts to save the profile stage.
  #
  # * +params+ - the request params containing profile data.
  #
  # @return [boolean]
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
  # @return [boolean]
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
  # @return [boolean]
  def save_employment
    self.current_stage = :references_stage
    self.save
    true
  end

  # Retrieve reference or create new one as needed.
  #
  # @return [Reference]
  def create_reference
    self.reference or Reference.new
  end

  # Attempts to save updated references stage.
  #
  # * +reference+ - the reference object to add or update.
  # * +params+ - the request params containing reference data.
  #
  # @return [boolean]
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
  # @return [boolean]
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
  # @return [boolean]
  def save_courses
    if self.course_selections.empty?
      self.errors.add(:you, 'must apply for at least one course')
      return false
    end
    self.current_stage = :submit_stage
    self.save validate: false # don't want to worry about rest of application here.
  end

  # Attempts to submit the application.
  #
  # * +confirmed+ - a boolean indicating if the student has confirmed the submission.
  #
  # @return [boolean]
  def save_submit(confirmed)
    unless confirmed
      self.errors.add(:confirm, 'box must be checked in order to submit.')
      return false
    end

    if self.submitting? and self.submit_stage?
      self.status = :awaiting_payment
      self.submitted_date = DateTime.now
      self.save

      create_application_payment.save!

      StudentMailer.application_submitted(student, self).deliver_later

      true
    else
      self.errors.add(:section, "'#{self.current_stage.humanize}' has not been completed")
      false
    end
  end

  # Creates a new application payment with a status of null.
  #
  # @return [Payment]
  def create_application_payment
    Payment.new application: self,
                amount: self.calculate_fee,
                description: "Application fee (#{pluralize self.course_selections_count, 'course'})"
  end

  # Gets the most recent unpaid payment for the application.
  #
  # @return [Payment]
  def unpaid_payment
    self.payments.where(status: nil).or(self.payments.where(status: :failed)).last
  end

  # Saves the application as completed.
  def save_completed
    self.status = :completed
    self.save!
    StudentMailer.application_completed(self.student, self).deliver_later
  end

  # Gets the date that a student decision is due.
  #
  # * +year+ - an optional year int to use.
  #
  # @return [Date]
  def self.calculate_replies_due(year=nil)
    today = Date.today
    year = today.year if year.nil?
    if today < Date.new(year, 3, 31)
      Date.new(year, 5, 6)
    elsif today < Date.new(year, 5, 7)
      Date.new(year, 6, 4)
    elsif today < Date.new(year, 6, 4)
      Date.new(year, 6, 25)
    else
      Date.new(year, 7, 23)
    end
  end

  private
    # Calculates the date that replies are due for this application. We have to figure out the date of the next course
    # start, in case the decision is being made a different year. For instance, a decision made in Dec 2016 for a course
    # starting Aug 2017.
    #
    # @return [Date]
    def calculate_replies_due
      date = Course.joins(:course_selections)
                 .where('course_selections.application_id' => self.id)
                 .order(:start_date).first.start_date
      Application.calculate_replies_due date.year
    end

    # Called when updating. Checks if we're in awaiting_decisions state and if all selections have offers, if so they
    # updates application to new state.
    def update_for_awaiting_decisions
      if awaiting_decisions? && all_selections_have_college_offers?
        if all_selections_rejected?
          self.status = :all_rejected
          # We mark courses as skipped, meaning that a student choice was not asked for.
          CourseSelection.update_all_student_choices self, :skipped
        else
          # Waiting for student.
          self.status = :awaiting_replies
          self.replies_due = calculate_replies_due # Store the final replies due date.
        end

        self.save! validate: false

        StudentMailer.decisions_made(self.student, self).deliver_later
      end
    end

    # Determines if all selections have had offers made.
    #
    # @return [boolean]
    def all_selections_have_college_offers?
      self.course_selections.any? && self.course_selections.map {|c| c.college_offer.present?}.all?
    end

    # Determines if all course selections have a rejected offer.
    #
    # @return [boolean]
    def all_selections_rejected?
      self.course_selections.all? {|s| s.rejected?}
    end

    # Determines if applications are open and adds validation errors if they're not.
    def applications_are_open
      unless Application.current_year.include? Date.today
        self.errors.add(:applications, 'are closed')
      end
    end
end
