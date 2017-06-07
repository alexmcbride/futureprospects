# * Name: Alex McBride
# * Date: 25/05/2017
# * Project: Future Prospects
# * Model class to represent a course category.
class Category < ApplicationRecord
  include ActionView::Helpers::TextHelper

  # @!attribute id
  #   @return [Integer]
  #   The model ID.

  # @!attribute name
  #   @return [String]
  #   The category name.

  # @!attribute created_at
  #   @return [DateTime]
  #   The creation date.

  # @!attribute updated_at
  #   @return [DateTime]
  #   The last update time.

  # Validators
  validates :name, presence: true, length: { maximum: 40}, uniqueness: true

  # @!attribute courses
  #   @return [Array<Course>]
  #   The courses association for the category.
  has_many :courses, dependent: :destroy

  # Removes the category if the supplied name matches and there are no courses currently in the category.
  #
  # @param category_name [String] the name of the category as entered by the user.
  # @return [Boolean] true if the category was removed.
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
      self.destroy
      return true
    end

    false
  end
end
