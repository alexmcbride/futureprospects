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

  # Searches for job with the specified name.
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
