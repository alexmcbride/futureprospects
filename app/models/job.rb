class Job < ApplicationRecord
  validates :employer, presence: true
  validates :address_1, presence: true
  validates :address_2, presence: false
  validates :postcode, presence: true
  validates :country, presence: true
  validates :duties, presence: true
  validates :job_title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  belongs_to :application
end
