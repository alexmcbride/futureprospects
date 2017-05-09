# Model class to represent a User.
class User < ApplicationRecord
  # Include devise modules.
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :lockable, :timeoutable, :authentication_keys => [:login]

  # Relations
  has_many :applications
  belongs_to :college
  attr_accessor :login
  before_create :before_create

  # Validators
  validates :first_name, presence: true, length: {maximum: 35, minimum: 1}
  validates :family_name, presence: true, length: {maximum: 35, minimum: 2}

  # Add role support.
  rolify

  # Sets the login name - either username or email address.
  #
  # * +login+ - the user's login.
  def login=(login)
    @login = login
  end

  # Gets login, username, or email, depending on which is set.
  #
  # Returns - the user's username or email, depending on what they used to login.
  def login
    @login || self.username || self.email
  end

  # Gets the user's first_name and family_name concatenated together.
  #
  # Returns - the user's full name.
  def full_name
    "#{self.first_name} #{self.family_name}"
  end

  # Determines if this user is a student.
  #
  # Returns - a boolean true if this user is a student.
  def student?
    self.type == 'Student'
  end

  # Determines if this user is staff.
  #
  # Returns - a boolean true if this user is a staff member.
  def staff?
    self.type == 'Staff'
  end

  # Generates a random eight character password.
  #
  # Returns -  the generated password.
  def self.generate_password
    Devise.friendly_token.first 8
  end

  # Removes the user if the username matches
  #
  # * +username+ - the username, entered by the user, to test if it matches.
  #
  # Returns - a boolean indicating if the user was removed or a validation error added.
  def remove_user(username)
    if username == self.username
      self.destroy!
      true
    else
      self.errors.add(:username, "does not match '#{self.username}'")
      false
    end
  end

  private
    # Overrides Devise sign in to allow both username and email address to be used.
    #
    # * +warden_conditions+ - conditions supplied by the warden gem.
    def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if (login = conditions.delete(:login))
        where(conditions.to_h).where(['lower(username) = :value OR lower(email) = :value', {value: login.downcase}]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end

    # ActiveRecord callback called before student is created, in order to generate a username.
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
    #
    # * +first_name+ - the user's first name
    # * +family_name+ - the user's family name
    #
    # Returns - the generated username.
    def generate_username(first_name, family_name)
      initial = first_name[0].downcase
      family_name = family_name.downcase
      number = rand(100..999)
      initial + family_name + number.to_s
    end

    # Checks if the supplied username is in use or not.
    #
    # * +username+ - the username to check.
    #
    # Returns - a boolean true if the username is free.
    def username_free?(username)
      User.find_by_username(username).nil?
    end

end
