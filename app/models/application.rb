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
  validate :check_institutions

  # Validations shared between application and student.
  include StudentValidator

  attr_accessor :validate_institutions

  # Foreign Keys
  belongs_to :student
  has_many :institutions

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

  def check_institutions
    if self.validate_institutions
      self.institutions.each do |school|
        if school.qualifications.empty?
          self.errors.add(:institution, "'#{school.name}' does not contain any qualifications")
        end
      end
    end
  end
end
