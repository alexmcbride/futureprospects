# Model class to represent a student's job.
class Job < ApplicationRecord
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

  belongs_to :application

  # Generates an address
  #
  # * +separator+ - the line separator.
  #
  # Returns - the address as a string.
  def address(separator='<br>')
    [address_1, address_2, city, postcode, country].join(separator).html_safe
  end
end
