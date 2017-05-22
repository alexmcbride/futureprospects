# Model class to represent a student. Inherits from User and uses Single-Table Inheritance.
class Student < User
  # Some validations are shared between student and application
  include StudentValidator

  # Foreign Keys
  has_many :applications

  attr_reader :current_application

  # Creates a new application, filled with some info we already know.
  #
  # Returns a new application object, or nil if one already exists.
  def create_application
    unless self.has_current_application?
      Application.create_for_student self
    end
  end

  # Finds the current application, which is an application made in the last year.
  #
  # Returns the student's current application, which is defined as any application active in the last year.
  def current_application
    # Get from last year for Postgresql
    @current_application ||= self.applications.current.first
  end

  # Checks if the student has a current application
  #
  # Returns a boolean indicating if the student has a current_application.
  def has_current_application?
    not self.current_application.nil?
  end

  # Gets all payments made by this student.
  #
  # Returns an ActiveRecord::Relation containing the payment objects.
  def all_payments
    Payment.joins(:application).where('applications.student_id=?', id).where.not(status: nil)
  end

  # Sends a text message to the student, if they have a current application and have entered a mobile number.
  #
  # @param body [String] the message to send.
  #
  # @return [Boolean] true if the message was sent.
  def send_text_message(body)
    app = current_application
    if app.present?
      app.send_text_message body
    end or false
  end
end
