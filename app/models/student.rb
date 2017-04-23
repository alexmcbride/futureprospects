# Model class to represent a student. Inherits from User and uses Single-Table Inheritance.
class Student < User
  # Some validations are shared between student and application
  include StudentValidator

  # Foreign Keys
  has_many :applications

  # Creates a new application, filled with some info we already know.
  #
  # Returns - a new application object, or nil if one already exists.
  def create_application
    unless self.has_current_application?
      application = Application.new
      application.email = self.email
      application.first_name = self.first_name
      application.family_name = self.family_name
      application.scottish_candidate_number = self.scottish_candidate_number
      application.national_insurance_number = self.national_insurance_number
      application.state = :applying
      application.student = self
      application.save validate: false # Can't validate at this point
      application
    end
  end

  # Finds the current application, which is an application made in the last year.
  #
  # Returns - the student's current application, which is defined as any application active in the last year.
  def current_application
    # Get from last year for Postgresql
    self.applications.where("created_at > CURRENT_DATE - INTERVAL '1 year'").first
  end

  # Checks if the student has a current application
  #
  # Returns - a boolean indicating if the student has a current_application.
  def has_current_application?
    not self.current_application.nil?
  end
end
