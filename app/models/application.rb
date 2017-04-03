class Application < ApplicationRecord
  enum gender: [:male, :female, :other]
  enum state: [:creating, :submitted, :paid]
  enum payment_type: [:credit_card, :paypal]

  validates :title, presence: true, length: { maximum: 35 }
  validates :first_name, presence: true, length: { maximum: 35 }
  validates :middle_name, presence: true, length: { maximum: 30 }
  validates :family_name, presence: true, length: { maximum: 35 }
  validates :previous_name, length: { maximum: 70 }
  validates :gender, presence: true
  validates :telephone, presence: true, length: { maximum: 12 }
  validates :mobile, length: { maximum: 12 }
  validates :email, presence: true, length: { maximum: 254 }
  validates :disability, length: { maximum: 100 }
  validates :personal_statement, presence: true, length: { maximum: 500 }
  validates :permanent_house_number, presence: true, length: { maximum: 12 }
  validates :permanent_address_1, presence: true, length: { maximum: 35 }
  validates :permanent_address_2, length: { maximum: 35 }
  validates :permanent_postcode, presence: true, length: { maximum: 8 }
  validates :permanent_country, presence: true, length: { maximum: 35 }
  validates :correspondence_house_number, presence: true, length: { maximum: 12 }
  validates :correspondence_address_1, presence: true, length: { maximum: 35 }
  validates :correspondence_address_2, length: { maximum: 35 }
  validates :correspondence_postcode, presence: true, length: { maximum: 8 }
  validates :correspondence_country, presence: true, length: { maximum: 35 }
  validates :state, presence: true
  validates :submitted_date, presence: true
  validates :payment_amount, presence: false
  validates :payment_type, presence: false
  validates :payment_date, presence: false

  belongs_to :student
end
