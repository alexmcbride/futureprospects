class Student < ApplicationRecord
  # Include devise modules.
  devise :database_authenticatable, :registerable, :recoverable, :trackable, :validatable, :confirmable,
         :lockable, :timeoutable, :authentication_keys => [:login]

  # Validators
  validates :first_name, presence: true, length: {maximum: 35, minimum: 1}
  validates :family_name, presence: true, length: {maximum: 35, minimum: 2}
  validates :scottish_candidate_number, presence: true, uniqueness: true, length: {minimum: 9, maximum: 9}, numericality: {only_integer: true}
  validate :validate_scn
  validates :national_insurance_number, presence: true, uniqueness: true, length: {maximum: 9}
  validates_format_of :national_insurance_number, with: /^(?!BG)(?!GB)(?!NK)(?!KN)(?!TN)(?!NT)(?!ZZ)(?:[A-CEGHJ-PR-TW-Z][A-CEGHJ-NPR-TW-Z])(?:\s*\d\s*){6}([A-D]|\s)$/, multiline: true

  # Foreign Key
  has_many :applications

  # Properties
  attr_accessor :login

  # ActiveRecord callbacks
  before_create :before_create
  # after_create :after_create

  # Sets the login value.
  def login=(login)
    @login = login
  end

  # Gets login, username, or email, depending on which is set.
  def login
    @login || self.username || self.email
  end

  # Gets the current application, which is an application made in the last year.
  def current_application
    # Get from last year for Postgresql
    self.applications.where("created_at > CURRENT_DATE - INTERVAL '1 year'").first
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

  # Called after student is created, adds a default application.
  def after_create
    app = Application.new
    app.scottish_candidate_number = self.scottish_candidate_number
    app.national_insurance_number = self.national_insurance_number
    app.first_name = self.first_name
    app.family_name = self.family_name
    app.email = self.email
    app.student = self
    app.save(validate: false) # don't validate on save
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

  # Called by validators to check if SCN is correct.
  def validate_scn
    unless self.scottish_candidate_number.empty?
      unless Student.validate_scn self.scottish_candidate_number
        self.errors.add(:scottish_candidate_number, 'did not pass checksum')
      end
    end
  end

  # Checks if a scottish candidate number is correct: https://www.hesa.ac.uk/collection/c15051/a/scn
  def self.validate_scn(scn)
    nums = scn.chars.map { |c| c.to_i }
    check_digit = Student.generate_check_digit nums
    # As check is single digit a ten is invalid
    not (check_digit == 10 or check_digit != nums.last)
  end

  # Generates a valid scottish candidate number for testing
  # * First 2 digits are year
  # * Next 6 are randomly generated
  # * Last digit is check digit
  def self.generate_scn
    year = DateTime.now.year
    tens = year % 1000 / 10
    ones = year % 1000 % 10
    # Keep generating until we get a check digit that doesn't end in 10
    scn = ''
    begin
      randoms = (0...6).each.map {|i| rand(0..9) }
      number = [tens, ones] + randoms
      check_digit = Student.generate_check_digit(number)
      scn = number.join + check_digit.to_s
    end until check_digit != 10
    scn
  end

  # Generates a valid check digit for a SCN.
  # * Multiply each char by weight and sum result
  # * Divide sum by 11 and store remainder
  # * If remainder is 0 then check is 0
  # * Otherwise subtract remainder from 11 to get check digit
  def self.generate_check_digit(nums)
    sum = 0
    [3, 2, 7, 6, 5, 4, 3, 2].each.with_index do |v, i|
      sum += nums[i] * v
    end
    remainder = sum % 11
    remainder == 0 ? 0 : 11 - remainder
  end
end
