class Category < ApplicationRecord
  # Validators
  validates :name, presence: true, length: { maximum: 40}, uniqueness: true

  # Foreign Keys
  has_many :courses

  # Removes category if name matches and there are no courses
  def remove?(category_name)
    if category_name != self.name
      self.errors.add(:name, "does not match '#{self.name}'")
    end

    unless self.courses.empty?
      self.errors.add(:category, 'has one or more courses and cannot be removed')
    end

    if self.errors.empty?
      self.courses.destroy_all
      self.destroy
      return true
    end

    false
  end
end
