# * Name: Alex McBride
# * Date: 24/05/2017
# * Project: Future Prospects
# * Model class to represent a job in the student's employment history.
class Job < ApplicationRecord
  # Validators
  validates :employer, presence: true, length: {maximum: 35}
  validates :address_1, presence: true, length: {maximum: 35}
  validates :address_2, presence: false, length: {maximum: 35}
  validates :city, presence: true, length: {maximum: 35}
  validates :postcode, presence: true, length: {maximum: 8}
  validates :country, presence: true, length: {maximum: 35}
  validates :duties, presence: true, length: {maximum: 128}
  validates :job_title, presence: true, length: {maximum: 35}
  validates :start_date, presence: true
  validates :end_date, presence: true

  # @!attribute id
  #   @return [Fixnum]
  #   The job ID.

  # @!attribute application_id
  #   @return [Fixnum]
  #   The application that the job belongs to.

  # @!attribute employer
  #   @return [String]
  #   The employer's name.

  # @!attribute address_1
  #   @return [String]
  #   The employer's address first line.

  # @!attribute address_2
  #   @return [String]
  #   The employer's address second line.

  # @!attribute postcode
  #   @return [String]
  #   The employer's post code.

  # @!attribute city
  #   @return [String]
  #   The employer's city.

  # @!attribute country
  #   @return [String]
  #   The employer's country.

  # @!attribute job_title
  #   @return [String]
  #   The student's job title.

  # @!attribute duties
  #   @return [String]
  #   The student's duties.

  # @!attribute country
  #   @return [String]
  #   The employer's country.

  # @!attribute start_date
  #   @return [Date]
  #   The start date of the job.

  # @!attribute end_date
  #   @return [Date]
  #   The end date of the job.

  # @!attribute created_at
  #   @return [DateTime]
  #   The creation date.

  # @!attribute updated_at
  #   @return [DateTime]
  #   The last update time.

  # @!attribute application
  #   @return [Application]
  #   The application the job belongs to.
  belongs_to :application

  # Common validators.
  include DateValidator

  # Scope to find jobs for applications containing course selections the specified course.
  #
  # @param course [Course] the course to include in the query.
  # @return [Array<CourseSelection>]
  scope :course, ->(course){Job.joins(application: :course_selections).where('course_selections.course_id'=>course.id)}

  # Searches for jobs that match the specified term.
  #
  # @param term [String] the name to search for.
  # @return [Array<Job]
  def self.search(term)
    if term.nil? or term.empty?
      return Job.none
    end
    Job.select('DISTINCT employer, address_1, address_2, city, postcode, country').where('LOWER(employer) LIKE LOWER(?)', "%#{term}%")
  end
end
