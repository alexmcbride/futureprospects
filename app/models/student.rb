class Student < ApplicationRecord
  # Include devise modules.
  devise :database_authenticatable, :registerable, :recoverable, :trackable, :validatable, :confirmable, :lockable,
         :timeoutable, :authentication_keys => [:login]

  # Validators
  validates :first_name, presence: true, length: {maximum: 35, minimum: 1}
  validates :family_name, presence: true, length: {maximum: 35, minimum: 2}

  # Validations shared between student and application
  include StudentValidator

  # Foreign Key
  has_many :applications

  # Properties
  attr_accessor :login

  # ActiveRecord callbacks
  before_create :before_create

  # Sets the login value.
  def login=(login)
    @login = login
  end

  # Gets login, username, or email, depending on which is set.
  def login
    @login || self.username || self.email
  end

  def full_name
    "#{self.first_name} #{self.family_name}"
  end

  # Creates a new application, filled with some info we already know.
  def create_application
    if self.has_current_application?
      nil
    else
      application = Application.new
      application.email = self.email
      application.first_name = self.first_name
      application.family_name = self.family_name
      application.scottish_candidate_number = self.scottish_candidate_number
      application.national_insurance_number = self.national_insurance_number
      application.student = self
      application.save validate: false # Can't validate at this point
      application
    end
  end

  # Gets the current application, which is an application made in the last year.
  def current_application
    # Get from last year for Postgresql
    self.applications.where("created_at > CURRENT_DATE - INTERVAL '1 year'").first
  end

  def has_current_application?
    not self.current_application.nil?
  end

  # Overrides Devise sign in to allow both username and email address to be used.
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  # Called before student is created, in order to generate username.
  def before_create
    # Keep generating a username until we find one that's not being used
    while true
      username = generate_username self.first_name, self.family_name
      if username_free? username
        self.username = username
        break
      end
    end
  end

  # Generate username with initial, family name, then three digit random number
  def generate_username(first_name, family_name)
    initial = first_name[0].downcase
    family_name = family_name.downcase
    number = rand(100..999)
    initial + family_name + number.to_s
  end

  # Gets a boolean indicating if the username is in use or not.
  def username_free?(username)
      Student.find_by_username(username).nil?
  end
end
