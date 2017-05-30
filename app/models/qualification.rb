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

  # @!attribute id
  #   @return [Fixnum]
  #   The qualification ID.

  # @!attribute school_id
  #   @return [Fixnum]
  #   The school that the qualification was attained at.

  # @!attribute subject
  #   @return [String]
  #   The subject the student was studying.

  # @!attribute award
  #   @return [String]
  #   The award the student attained.

  # @!attribute grade
  #   @return [String]
  #   The grade that student attained.

  # @!attribute start_date
  #   @return [Date]
  #   The start date of the qualification.

  # @!attribute end_date
  #   @return [Date]
  #   The end date of the qualification.

  # @!attribute created_at
  #   @return [DateTime]
  #   The creation date.

  # @!attribute updated_at
  #   @return [DateTime]
  #   The last update time.

  # @!attribute school
  #   @return [School]
  #   The qualification's parent school.
  belongs_to :school

  # Common validators.
  include DateValidator
end