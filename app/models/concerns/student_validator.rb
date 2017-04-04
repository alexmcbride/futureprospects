module StudentValidator
  extend ActiveSupport::Concern

  NIN_REGEX = /^(?!BG)(?!GB)(?!NK)(?!KN)(?!TN)(?!NT)(?!ZZ)(?:[A-CEGHJ-PR-TW-Z][A-CEGHJ-NPR-TW-Z])(?:\s*\d\s*){6}([A-D]|\s)$/

  included do
    validates :scottish_candidate_number, presence: true, uniqueness: true, length: {minimum: 9, maximum: 9}, numericality: {only_integer: true}
    validate :validate_scn
    validates :national_insurance_number, presence: true, uniqueness: true, length: {maximum: 9}
    validates_format_of :national_insurance_number, with: NIN_REGEX, multiline: true
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