# * Name: Alex McBride
# * Date: 24/05/2017
# * Project: Future Prospects
# * Module that adds start and end date validation to a model class.
module DateValidator
  extend ActiveSupport::Concern

  included do
    validate :start_date_before_end_date
  end

  # Validates that the start date is before the end date.
  def start_date_before_end_date
    if start_date && end_date
      unless start_date < end_date
        self.errors.add(:start_date, 'must be before end date')
      end
    end
  end
end