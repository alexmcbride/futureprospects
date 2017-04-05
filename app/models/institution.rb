class Institution < ApplicationRecord
  validates :name, presence: true
  validates :address_1, presence: true
  validates :address_2, presence: false
  validates :postcode, presence: true
  validates :country, presence: true

  belongs_to :application
  has_many :qualifications

  def has_qualifications?
    not self.qualifications.empty?
  end
end
