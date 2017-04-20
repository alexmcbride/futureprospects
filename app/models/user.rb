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

  rolify

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

  # Determines if this user is a student.
  def student?
    self.type == 'Student'
  end

  # Determines if this user is staff.
  def staff?
    self.type == 'Staff'
  end

  # Generates a random eight character password
  def self.generate_password
    Devise.friendly_token.first 8
  end

  # Removes the user if the username matches
  def remove_user(username)
    if username == self.username
      self.destroy!
      true
    else
      self.errors.add(:username, "does not match '#{self.username}'")
      false
    end
  end

  # Changed a user's roles. Permissions is a hash: {role_name: 'yes'}
  def change_roles(permissions)
    # If permissions empty, remove all roles.
    if permissions.nil? or permissions.empty?
      remove_all_roles
    else
      # Loop through each role, if it's in permission add or keep it, otherwise remove it.
      Role.all.each do |role|
        # We don't let anyone change top level admin.
        if role.name == :site_admin
          continue
        end

        # Check other roles.
        has_role = has_role? role.name
        if permissions.key? role.name
          unless has_role
            add_role role.name
          end
        elsif has_role
          remove_only_role_relation role.name
        end
      end
    end
  end

  # Removes all roles for this user from users_roles
  def remove_all_roles
    Role.all.each {|r| remove_only_role_relation r.name}
  end

  # Removes role from users_roles and leaves the roles table alone.
  def remove_only_role_relation(role_name)
    roles.delete(roles.where(:name => role_name))
  end
end
