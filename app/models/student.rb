# * Name: Alex McBride
# * Date: 25/05/2017
# * Project: Future Prospects
# * Model class to represent a student. Inherits from User and uses Single-Table Inheritance.
class Student < User
  # Add oauth providers
  devise :omniauthable, :omniauth_providers => [:google_oauth2, :facebook, :twitter]

  # Constant regex used for validating national insurance numbers.
  NIN_REGEX = /^(?!BG)(?!GB)(?!NK)(?!KN)(?!TN)(?!NT)(?!ZZ)(?:[A-CEGHJ-PR-TW-Z][A-CEGHJ-NPR-TW-Z])(?:\s*\d\s*){6}([A-D]|\s)$/

  # Validators
  validates :scottish_candidate_number, presence: true, uniqueness: true, length: {minimum: 9, maximum: 9}, numericality: {only_integer: true}
  validate :internal_validate_scn
  validates :national_insurance_number, presence: true, uniqueness: true, length: {maximum: 9}
  validates_format_of :national_insurance_number, with: NIN_REGEX, multiline: true

  # @!attribute applications
  #   @return [Array<Application>]
  #   The student's one-to-many association with applications. A student can have many applications, but only one for the current academic year.
  has_many :applications, dependent: :destroy

  # @!attribute current_application
  #   @retrn [Application]
  #   The student's application for the current academic year.
  attr_reader :current_application

  # Finds the student with the specified open authentication provider details.
  #
  # @param provider [String] the oauth provider.
  # @param uid [String] the oauth unique identifier.
  # @return [Array<Student>] the student object or nil.
  scope :find_open_auth, ->(provider, uid){ where(provider: provider, uid: uid) }

  # Creates a new application for this student.
  #
  # @return [Application]
  def create_application
    unless self.has_current_application?
      Application.create_for_student self
    end
  end

  # Finds the current application, which is an application made for the current academic year.
  #
  # @return [Application]
  def current_application
    # Get from last year for Postgresql
    @current_application ||= self.applications.current.first
  end

  # Checks if the student has a current application.
  #
  # @return [Boolean]
  def has_current_application?
    not self.current_application.nil?
  end

  # Gets all payments made by this student.
  #
  # @return [Array<Payment>]
  def all_payments
    Payment.joins(:application).where('applications.student_id=?', id).where.not(status: nil)
  end

  # Sends a text message to the student, if they have a current application and have entered a mobile number.
  #
  # @param body [String] the message to send.
  def send_text_message(body)
    app = current_application
    if app.present?
      app.send_text_message body
    end
  end

  # Creates new student based on oauth data.
  #
  # @param data [Hash] the data from an oauth provider.
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

  # Create new student based on oauth data then updates it with the specified params (e.g. data from a form).
  #
  # @param data [Hash] the data from an oauth provider.
  # @param params [Hash] the data to update the student with.
  # @return [Student]
  def self.create_from_oauth(data, params)
    student = new_from_oauth data
    student.update_attributes params
    student.password_confirmation = student.password = Devise.friendly_token[0,20] # Dummy password
    student.skip_confirmation! # Google has verified the email
    student
  end

  # Checks if a scottish candidate number is correct. See for details: https://www.hesa.ac.uk/collection/c15051/a/scn
  #
  # @param scn [String] the number to validate.
  # @return [Boolean] true if the number is valid.
  def self.validate_scn(scn)
    nums = scn.chars.map { |c| c.to_i }
    check_digit = generate_check_digit nums
    # As check is single digit a ten is invalid
    not (check_digit == 10 or check_digit != nums.last)
  end

  # Generates a valid scottish candidate number for testing. Optionally specify the year (e.g. 2012).
  #
  # * First 2 digits are year
  # * Next 6 are randomly generated
  # * Last digit is check digit
  #
  # @param year [Integer] an optional DateTime object to use for the first two digits.
  # @return [String] a valid scottish candidate number.
  def self.generate_scn(year=nil)
    year = DateTime.now.year if year.nil?
    tens = year % 1000 / 10
    ones = year % 1000 % 10
    # Keep generating until we get a check digit that doesn't end in 10
    scn = ''
    begin
      randoms = (0...6).each.map {|i| rand(0..9) }
      number = [tens, ones] + randoms
      check_digit = generate_check_digit(number)
      scn = number.join + check_digit.to_s
    end until check_digit != 10
    scn
  end

  # Generates a valid check digit for a SCN.
  #
  # The algorithm works as follows:
  # * Multiply each char by weight and sum result
  # * Divide sum by 11 and store remainder
  # * If remainder is 0 then check digit is also 0
  # * Otherwise subtract remainder from 11 to get check digit
  #
  # @param nums [Array<Integer>] an array containing each number of the SCN.
  # @return [Integer] the check digit.
  def self.generate_check_digit(nums)
    weights = [3, 2, 7, 6, 5, 4, 3, 2]
    sum = 0
    weights.each.with_index do |weight, index|
      sum += nums[index] * weight
    end
    remainder = sum % 11
    remainder == 0 ? 0 : 11 - remainder
  end

  private
    # Called by validators to check if SCN is correct.
    def internal_validate_scn
      unless self.scottish_candidate_number.empty?
        unless Student.validate_scn self.scottish_candidate_number
          self.errors.add(:scottish_candidate_number, 'is not valid')
        end
      end
    end
end
