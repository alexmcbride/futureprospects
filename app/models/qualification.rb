# * Name: Alex McBride
# * Date: 25/05/2017
# * Project: Future Prospects
# * Model class representing a student qualification.
class Qualification < ApplicationRecord
  validates :subject, presence: true, length: { maximum: 100 }
  validates :award, presence: true, length: { maximum: 35 }
  validates :grade, presence: true, length: { maximum: 10 }
  validates :start_date, presence: true
  validates :end_date, presence: true

  # @!attribute school
  #   @return [School]
  #   The qualification's parent school.
  belongs_to :school

  # Common validators.
  include DateValidator
end