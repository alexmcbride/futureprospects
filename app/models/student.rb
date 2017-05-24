# Model class to represent a student. Inherits from User and uses Single-Table Inheritance.
class Student < User
  devise :omniauthable, :omniauth_providers => [:google_oauth2, :facebook, :twitter]

  # Some validations are shared between student and application
  include StudentValidator

  # Foreign Keys
  has_many :applications, dependent: :destroy

  # Attributes
  attr_reader :current_application

  # Finds the student with the specified open authentication provider.
  #
  # @param provider [String] the oauth provider.
  # @param uid [String] the oauth unique identifier.
  # @return [Array<Student>] the student object or nil.
  scope :find_open_auth, ->(provider, uid){ where(provider: provider, uid: uid) }

  # Creates a new application, filled with some info we already know.
  #
  # @return [Application]
  def create_application
    unless self.has_current_application?
      Application.create_for_student self
    end
  end

  # Finds the current application, which is an application made in the last year.
  #
  # @return [Application]
  def current_application
    # Get from last year for Postgresql
    @current_application ||= self.applications.current.first
  end

  # Checks if the student has a current application
  #
  # @return [Boolean]
  def has_current_application?
    not self.current_application.nil?
  end

  # Gets all payments made by this student.
  #
  # @return [ActiveRecord::Relation]
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

  # Create new student from oauth data.
  #
  # @param data [Hash] the data from an oauth provider.
  #
  # @return [Student]
  def self.new_from_oauth(data)
    student = Student.new
    student.provider = data['provider']
    student.uid = data['uid']
    student.email = data['info']['email']
    student.first_name = data['info']['first_name']
    student.family_name = data['info']['last_name']
    student
  end

  # Create new student from oauth data with params data (e.g. from a form).
  #
  # @param data [Hash] the data from an oauth provider.
  # @param params [Hash] the data to update the student with.
  #
  # @return [Student]
  def self.create_from_oauth(data, params)
    student = new_from_oauth data
    student.update_attributes params
    student.password_confirmation = student.password = Devise.friendly_token[0,20] # Dummy password
    student.skip_confirmation! # Google has verified the email
    student
  end

  # Removes the student from the system.
  #
  # @param username [String] the student's username as a precaution.
  # @return [Boolean] true if the student was removed.
  def remove(username)
    if username == self.username
      self.destroy
      true
    else
      self.errors.add(:username, "does not match '#{self.username}'")
      false
    end
  end
end
