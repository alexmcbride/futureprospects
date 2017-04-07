class Application < ApplicationRecord
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
  validates :telephone, presence: true, length: { maximum: 12 }
  validates :mobile, presence: false, length: { maximum: 12 }
  validates :email, presence: true, length: { maximum: 254 }
  validates :disability, presence: false, length: { maximum: 100 }
  validates :personal_statement, presence: false, length: { maximum: 500 }
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

  # Checks if the application is owned by this student
  def owned_by?(student)
    student.id == self.student_id
  end

  # Checks if the application is complete.
  def complete?
    self.completed_intro and self.completed_profile and self.completed_education and self.completed_employment and
        self.completed_references and self.completed_statement and self.completed_courses
  end

  # Checks if the application is incomplete.
  def incomplete?
    not complete?
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

  # Gets a symbol indicating the first uncompleted stage of the application
  def next_stage
    if self.completed_courses
      :submit
    elsif self.completed_statement
      :courses
    elsif self.completed_references
      :statement
    elsif self.completed_employment
      :references
    elsif self.completed_references
      :employment
    elsif self.completed_employment
      :employment
    elsif self.completed_profile
      :education
    elsif self.completed_intro
      :profile
    else
      :intro
    end
  end

  # Attempts to save the education stage
  def save_education?
    if self.schools_valid?
      self.completed_education = true
      self.save validate: false
      true
    else
      false
    end
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
      true
    else
      false
    end
  end

  # Attempts to save the employment stage
  def save_employment?
    self.completed_employment = true
    self.save
    true
  end
end
