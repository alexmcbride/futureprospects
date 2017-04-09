class School < ApplicationRecord
  validates :name, presence: true, length: {maximum: 35}
  validates :address_1, presence: true, length: {maximum: 35}
  validates :address_2, presence: false, length: {maximum: 35}
  validates :postcode, presence: true, length: { maximum: 8 }
  validates :country, presence: true, length: { maximum: 35 }

  belongs_to :application
  has_many :qualifications

  # Checks if the school has at least one qualification
  def qualifications_valid?
    not self.qualifications.empty?
  end

  # Adds a qualification to the school
  def add_qualification?(qualification)
    if self.dates_valid? qualification
      if qualification.valid?
        qualification.school = self
        qualification.save
        return true
      end
    else
      qualification.errors.add(:qualification, 'cannot be added as its dates overlap with an existing qualification')
    end
    false
  end

  # Checks if any of the qualification dates overlap
  def dates_valid?(qualification)
    if self.qualifications.count > 0
      durations = self.qualifications.map {|q| q.duration}
      durations.each do |duration|
        if qualification.duration.overlaps?(duration)
          return false
        end
      end
    end
    true
  end

  # Destroys school and any associated qualifications
  def destroy_with_qualifications
    self.qualifications.destroy_all
    self.destroy
  end
end
