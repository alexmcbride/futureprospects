class Application < ApplicationRecord
  # Constants
  STATEMENT_LENGTH = 2000
  MAX_COURSES = 5
  SINGLE_COURSE_FEE = 10
  MULTIPLE_COURSE_FEE = 20

  # Enums
  enum gender: [:male, :female, :other]
  enum state: [:active, :submitted, :paid, :completed]
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
  validates :state, presence: true
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

  # Checks if the application is owned by this student
  def owned_by?(student)
    student.id == self.student_id
  end

  # Checks if the application is complete.
  def complete?
    self.incomplete_stages.empty?
  end

  # Checks if the application is incomplete.
  def incomplete?
    not complete?
  end

  # Gets a symbol indicating the first uncompleted stage of the application
  def first_incomplete_stage
    stage = self.incomplete_stages.first
    stage.nil? ? :submit : stage
  end

  # Determines which stages of the application are incomplete
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

  # Checks that a school hasn't been added without a qualification.
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

  # Gets the number of courses the student can still add
  def available_courses
    MAX_COURSES - self.course_selections.size
  end

  # Checks if a student can still add courses to their application
  def can_add_course?
    self.available_courses > 0
  end

  # Calculates the student's application fee.
  def calculate_fee
    if self.course_selections.size > 1
      BigDecimal.new MULTIPLE_COURSE_FEE
    else
      BigDecimal.new SINGLE_COURSE_FEE
    end
  end

  # Attempts to save the education stage
  def save_education?
    if self.schools_valid?
      self.completed_education = true
      self.save validate: false
      return true
    end
    false
  end

  # Attempts to save the intro stage
  def save_intro?
    self.completed_intro = true
    self.save validate: false
    true
  end

  # Attempts to save the profile stage
  def save_profile?(params)
    self.attributes = params
    self.state = :active
    if self.valid?
      self.completed_profile = true
      self.save
      return true
    end
    false
  end

  # Attempts to save the employment stage
  def save_employment?
    self.completed_employment = true
    self.save
    true
  end

  # Retrieve reference or create new one as needed
  def create_reference
    self.reference or Reference.new
  end

  # Attempts to save updated references stage
  def save_references?(reference, params)
    reference.attributes = params
    if reference.valid?
      self.completed_references = true
      self.reference = reference
      self.save
      return true
    end
    false
  end

  # Attempt to save the personal statement stage
  def save_statement?(params)
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

  # Adds the course selection
  def add_course?(selection)
    selection.application = self
    if selection.valid? and CourseSelection.validate_selection? selection
      return selection.save
    end
    false
  end

  # Attempts to save the course selection
  def save_courses?
    if self.course_selections.empty?
      self.errors.add(:saving, 'requires that you must apply for at least one course')
      return false
    end
    self.completed_courses = true
    self.save
  end

  # Attempts to submit the application.
  def save_submit?(confirmed)
    unless confirmed
      self.errors.add(:confirm, 'box must be checked in order to submit.')
      return false
    end

    stages = self.incomplete_stages
    if stages.empty?
      self.state = :submitted
      self.submitted_date = DateTime.now
      self.save
      true
    else
      stages.each {|s| self.errors.add(s, 'section has not been completed')}
      false
    end
  end
end
