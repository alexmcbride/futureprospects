# Model class to represent a payment.
class Payment < ApplicationRecord
  PAYMENT_EXPIRY_DAYS = 7

  # Imports
  require 'active_merchant'
  require 'active_merchant/billing/rails'

  # Enums
  enum status: [:authorized, :failed]
  enum payment_type: [:credit_card, :paypal]
  enum card_brands: [:visa, :mastercard]

  # Relations
  belongs_to :application

  # Validators
  validates :payment_type, presence: true
  validates :amount, presence: true, numericality: {greater_than: 0}
  validates :status, presence: true
  validates :last_four_digits, presence: false
  validates :card_holder, presence: true

  # Attributes for holding card data while payment is being authorized.
  attr_accessor :card_brand
  attr_accessor :card_number
  attr_accessor :card_cvv
  attr_accessor :card_expiry
  attr_accessor :card_first_name
  attr_accessor :card_last_name

  # Authorizes a payment using the card details.
  #
  # Returns - a boolean indicating if the payment was authorized.
  def authorize
    # Set this model's attributes so it can be saved.
    self.amount = self.application.calculate_fee
    self.payment_type = :credit_card
    self.last_four_digits = credit_card.last_digits
    self.card_holder = "#{card_first_name} #{card_last_name}"
    self.status = :failed

    # Take payment if card and model are valid.
    card = credit_card
    if card_valid?(card) and valid?
      # Make payment
      result = authorize_payment card

      # Handle result.
      if result == :already_paid
        self.errors.add(:payment, 'for this application has already been received.')
        return false
      elsif result == :auth_failed
        handle_auth_failed
        return false
      elsif result == :auth_success
        handle_auth_success
        return true
      end
    end

    false # validation error
  end

  # Checks if the application has a successful payment
  #
  # * +application+ - the application to check
  #
  # Returns - a boolean indicating if a successful payment exists.
  def self.has_paid?(application)
    application.payments.where(status: :authorized).any?
  end

  # Checks if a payment_type is valid.
  #
  # * +payment_type+ - the payment type to test
  #
  # Returns - true if the payment type is valid.
  def self.valid_payment_type?(payment_type)
    %w(credit_card paypal).include? payment_type
  end

  # Finds an authorized payment, there should only be one.
  #
  # * +application+ - the application to find the payment for.
  #
  # Returns - the payment, if it exists.
  def find_authorized_payment(application)
    application.payments.find_by_status(:authorized)
  end

  # Gets the amount paid in pounds
  #
  # Returns - the amount in pounds.
  def amount_pounds
    amount / 100
  end

  # Checks if this payment has expired, meaning that it is failed and more than 7 days old.
  #
  # Returns - true if the payment has expired, false otherwise.
  def has_expired?
    failed? && self.created_at < (DateTime.now - PAYMENT_EXPIRY_DAYS.days)
  end

  def owner?(application)
    application_id == application.id
  end

  def expiry_time
    self.created_at + PAYMENT_EXPIRY_DAYS.days
  end

  private
    def handle_auth_failed
      save! # We save payment even if failed.
      self.errors.add(:authentication, 'failed for this payment.')
      send_payment_failed_email
    end

    def handle_auth_success
      self.status = :authorized
      save!
      send_payment_received_email
    end

    # Sends a payment confirmation email to the student who made the payment.
    def send_payment_received_email
      StudentMailer.payment_received(application.student, self).deliver_later
    end

    # Sends a payment failed email to the student who made the payment.
    def send_payment_failed_email
      # Check if we've already sent a failed payment email for this application.
      if Payment.where(status: :failed).where(application_id: self.application_id).empty?
        StudentMailer.payment_failed(application.student, self).deliver_later
      end
    end

    # Checks if the current card details are valid
    #
    # Returns - a boolean indicating if the details are valid.
    def card_valid?(card)
      unless card.valid?
        # Add card errors to this model, so errors gets displayed in form.
        card.errors.each {|k, v| errors.add(k, v[0])}
        return false
      end
      true
    end

    # Takes a payment using the card details.
    #
    # Returns - true if the payment authorization was processed, false if payment has already been mad.e
    def authorize_payment(card)
      # Check if this application has already been paid for (just to be safe).
      if Payment::has_paid? application
        return :already_paid
      end

      response = Payment::gateway.purchase(self.amount, card)

      # puts 'Payment response: ' + response.inspect
      unless response.success?
        return :auth_failed
      end

      :auth_success
    end

    # Creates a new CreditCard object from the options.
    #
    # Returns - a new credit card object, or nil if the object wasn't built.
    def credit_card
      card = ActiveMerchant::Billing::CreditCard.new(
          brand: card_brand,
          number: card_number,
          verification_value: card_cvv,
          first_name: card_first_name,
          last_name: card_last_name
      )
      card.month, card.year = Payment::try_parse_expiry card_expiry
      card
    end

    # Parses a Date object from a string.
    #
    # * +expiry+ - the string to parse (format: mm/yyyy)
    #
    # Returns - a tuple with (month, year) as integers.
    def self.try_parse_expiry(expiry)
      begin
        expiry = Date.strptime expiry, '%m/%Y'
        [expiry.month, expiry.year]
      rescue ArgumentError
        [0, 0]
      end
    end

    # Creates a new gateway object, for taking a payment
    #
    # Returns - a new GateWay object, in test mode.
    def self.gateway
      ActiveMerchant::Billing::Base.mode = :test # sandbox mode
      ActiveMerchant::Billing::BraintreeGateway.new(
          :merchant_id => ENV['BRAINTREE_MERCHANT_ID'],
          :public_key  => ENV['BRAINTREE_PUBLIC_KEY'],
          :private_key => ENV['BRAINTREE_PRIVATE_KEY']
      )
    end
end
