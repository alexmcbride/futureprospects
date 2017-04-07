class Qualification < ApplicationRecord
  validates :subject, presence: true, length: { maximum: 100 }
  validates :award, presence: true, length: { maximum: 35 }
  validates :grade, presence: true, length: { maximum: 10 }
  validates :start_date, presence: true
  validates :end_date, presence: true

  belongs_to :school

  # Gets the date range the qualification ran for
  def duration
    self.start_date..self.end_date
  end

  # Gets if the course end date is in the future
  def future_end_date?
    end_date > DateTime.now
  end
end