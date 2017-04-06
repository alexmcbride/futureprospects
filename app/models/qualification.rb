class Qualification < ApplicationRecord
  validates :subject, presence: true
  validates :award, presence: true
  validates :grade, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  belongs_to :school
end