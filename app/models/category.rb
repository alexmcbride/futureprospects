class Category < ApplicationRecord
  include ActionView::Helpers::TextHelper

  # Validators
  validates :name, presence: true, length: { maximum: 40}, uniqueness: true

  # Foreign Keys
  has_many :courses

  # Removes category if name matches and there are no courses
  def remove?(category_name)
    if category_name != self.name
      self.errors.add(:name, "does not match '#{self.name}'")
    end

    # check there are no courses
    count = self.courses_count
    if count > 0
      self.errors.add(:category, "has #{pluralize count, 'course'} and cannot be removed")
    end

    # delete with courses if no errors
    if self.errors.empty?
      self.courses.destroy_all
      self.destroy
      return true
    end

    false
  end
end
