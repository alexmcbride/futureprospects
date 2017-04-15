class User < ApplicationRecord
  # Include devise modules.
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :lockable, :timeoutable, :authentication_keys => [:login]

  has_many :applications
  belongs_to :college
  attr_accessor :login
  before_create :before_create

  validates :first_name, presence: true, length: {maximum: 35, minimum: 1}
  validates :family_name, presence: true, length: {maximum: 35, minimum: 2}

  self.per_page = 20

  # Sets the login
  def login=(login)
    @login = login
  end

  # Gets login, username, or email, depending on which is set.
  def login
    @login || self.username || self.email
  end

  # Overrides Devise sign in to allow both username and email address to be used.
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(['lower(username) = :value OR lower(email) = :value', {:value => login.downcase }]).first
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
    User.find_by_username(username).nil?
  end

  # Gets the user's full name
  def full_name
    "#{self.first_name} #{self.family_name}"
  end

  def student?
    self.type == 'Student'
  end


  def staff?
    self.type == 'Staff'
  end
end
