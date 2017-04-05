class Qualification < ApplicationRecord
  validates :subject, presence: true
  validates :award, presence: true
  validates :grade, presence: false
  validates :start_date, presence: true
  validates :end_date, presence: false

  belongs_to :institution
end