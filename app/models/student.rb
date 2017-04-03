class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :authentication_keys => [:login]

  # Validators
  validates :first_name, presence: true
  validates :family_name, presence: true
  validates :scottish_candidate_number, presence: true, uniqueness: true
  validates :national_insurance_number, presence: true, uniqueness: true

  # Foreign Key
  has_many :applications

  # Properties
  attr_accessor :login

  # ActiveRecord callbacks
  before_create :before_create
  after_create :after_create

  # Sets the login value.
  def login=(login)
    @login = login
  end

  # Gets login, username, or email, depending on which is set.
  def login
    @login || self.username || self.email
  end

  # Gets the current application, or creates a new one if it doesn't exist
  def current_application
    self.applications.order(:updated_at).first
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

  # Called after student is first created and adds a default application.
  def after_create
    app = Application.new
    app.scottish_candidate_number = self.scottish_candidate_number
    app.national_insurance_number = self.national_insurance_number
    app.first_name = self.first_name
    app.family_name = self.family_name
    app.student = self
    app.save(validate: false) # don't validate on save
  end

  # Generate username with initial, family name, then three digit random number
  def generate_username(first_name, family_name)
    initial = first_name[0].downcase
    family_name = family_name.downcase
    number = rand(100...999)
    initial + family_name + number.to_s
  end

  # Gets a boolean indicating if the username is in use or not.
  def username_free?(username)
    student = Student.find_by_username username
    student.nil?
  end
end
