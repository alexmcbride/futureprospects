# Model class to represent a student. Inherits from User and uses Single-Table Inheritance.
class Student < User
  # Some validations are shared between student and application
  include StudentValidator

  # Foreign Keys
  has_many :applications

  attr_reader :current_application

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
      application.status = :submitting
      application.student = self
      application.save validate: false # Can't validate at this point
      application
    end
  end

  # Gets next stage of the application process.
  #
  # Returns - a symbol indicating the next stage.
  def application_status
    application = current_application
    if application.nil?
      :create_application
    elsif application.submitting?
      :continue_application
    elsif application.submitted?
      if application.cancelled?
        :application_cancelled
      elsif application.payments.count > 0
        :make_repayment
      else
        :make_payment
      end
    elsif application.completed?
      :track_application
    end
  end

  # Finds the current application, which is an application made in the last year.
  #
  # Returns - the student's current application, which is defined as any application active in the last year.
  def current_application
    # Get from last year for Postgresql
    @current_application ||= self.applications.where("created_at > CURRENT_DATE - INTERVAL '1 year'").first
  end

  # Checks if the student has a current application
  #
  # Returns - a boolean indicating if the student has a current_application.
  def has_current_application?
    not self.current_application.nil?
  end

  # Gets all payments made by this student.
  #
  # Returns - an ActiveRecord::Relation containing the payment objects.
  def all_payments
    Payment.joins(:application).where('applications.student_id=?', id)
  end
end
