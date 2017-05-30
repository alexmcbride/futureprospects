# * Name: Alex McBride
# * Date: 25/05/2017
# * Project: Future Prospects
# * Model class to represent a User. Both Staff and Student inherit from this class using single-table inheritance. The discriminator is stored in the +type+ attribute.
class User < ApplicationRecord
  # Include devise modules.
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable,
         :lockable,
         :timeoutable,
         :authentication_keys => [:login]

  # @!attribute id
  #   @return [Fixnum]
  #   The user ID.

  # @!attribute college_id
  #   @return [Fixnum]
  #   The college that the user belongs to, if a staff member.

  # @!attribute email
  #   @return [String]
  #   The user's email.

  # @!attribute encrypted_password
  #   @return [String]
  #   The user's password.

  # @!attribute reset_password_token
  #   @return [String]
  #   #   The user's reset password token.

  # @!attribute reset_password_sent_at
  #   @return [DateTime]
  #   The time the reset password email was sent.

  # @!attribute remember_created_at
  #   @return [DateTime]
  #   The time the user check the remember checkbox.

  # @!attribute sign_in_count
  #   @return [Fixnum]
  #   The number of times the user has signed in.

  # @!attribute current_sign_in_at
  #   @return [DateTime]
  #   The current time the user signed in.

  # @!attribute last_sign_in_at
  #   @return [DateTime]
  #   The last time the user signed in.

  # @!attribute current_sign_in_ip
  #   @return [IPAddr]
  #   The current sign in IP.

  # @!attribute last_sign_in_ip
  #   @return [IPAddr]
  #   The last sign in IP.

  # @!attribute confirmation_token
  #   @return [String]
  #   The token used to confirm the email.

  # @!attribute confirmed_at
  #   @return [DateTime]
  #   When the email was confirmed.

  # @!attribute confirmation_sent_at
  #   @return [DateTime]
  #   When the confirmation email was sent.

  # @!attribute unconfirmed_email
  #   @return [String]
  #   The unconfirmed email address.

  # @!attribute failed_attempts
  #   @return [Fixnum]
  #   The number of failed login attempts.

  # @!attribute unlock_token
  #   @return [String]
  #   The token used by the unlock account email.

  # @!attribute locked_at
  #   @return [DateTime]
  #   When the account was locked.

  # @!attribute type
  #   @return [String]
  #   The single-table inheritance discriminator.

  # @!attribute first_name
  #   @return [String]
  #   The user's first name.

  # @!attribute family_name
  #   @return [String]
  #   The user's second name.

  # @!attribute username
  #   @return [String]
  #   The user's automatically generated username.

  # @!attribute scottish_candidate_number
  #   @return [String]
  #   The student's scottish candidate number.

  # @!attribute national_insurance_number
  #   @return [String]
  #   The student's national insurance number.

  # @!attribute job_title
  #   @return [String]
  #   The staff member's job title.

  # @!attribute provider
  #   @return [String]
  #   The student's OAuth provider.

  # @!attribute uid
  #   @return [String]
  #   The student's OAuth UID.

  # @!attribute created_at
  #   @return [DateTime]
  #   The creation date.

  # @!attribute updated_at
  #   @return [DateTime]
  #   The last update time.

  # @!attribute login
  #   @return [String]
  #   Attribute to hold the user's current login email or username, depending on what was entered in the signin form.
  attr_accessor :login

  # Callbacks
  before_create :before_create

  # Validators
  validates :first_name, presence: true, length: {maximum: 35, minimum: 1}
  validates :family_name, presence: true, length: {maximum: 35, minimum: 2}

  # Add role support.
  rolify

  # Sets the login name - either username or email address.
  #
  # @param login [String]- the user's login.
  def login=(login)
    @login = login
  end

  # Gets login, username, or email, depending on which is set.
  #
  # @return [String]
  def login
    @login || self.username || self.email
  end

  # Gets the user's first_name and family_name concatenated together.
  #
  # @return [String]
  def full_name
    "#{self.first_name} #{self.family_name}"
  end

  # Determines if this user is a student.
  #
  # @return [Boolean] true if this user is a student.
  def student?
    self.type == 'Student'
  end

  # Determines if this user is staff.
  #
  # @return [Boolean] true if this user is a staff member.
  def staff?
    self.type == 'Staff'
  end

  # Generates a random eight character password.
  #
  # @return [String]
  def self.generate_password
    Devise.friendly_token.first 8
  end

  # Removes the user if the username matches.
  #
  # @param username [String] the username, entered by the user, to test if it matches.
  # @return [Boolean] indicating if the user was removed or a validation error added.
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
    # @param warden_conditions [Hash] conditions supplied by the warden gem.
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
    # @param first_name [String] the user's first name
    # @param family_name [String] the user's family name
    # @return [String] the generated username.
    def generate_username(first_name, family_name)
      initial = first_name[0].downcase
      family_name = family_name.downcase
      number = rand(100..999)
      initial + family_name + number.to_s
    end

    # Checks if the supplied username is in use or not.
    #
    # @param username [String] the username to check.
    # @return [Boolean] true if the username is free.
    def username_free?(username)
      User.find_by_username(username).nil?
    end
end
