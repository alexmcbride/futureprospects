# Model class to represent a payment.
class Payment < ApplicationRecord
  # Imports
  require 'active_merchant'
  require 'active_merchant/billing/rails'

  # Enums
  enum status: [:authorized, :failed]
  enum type: [:credit_card, :paypal]
  enum card_brands: [:visa, :mastercard]

  # Relations
  belongs_to :application

  # Validators
  validates :type, presence: true
  validates :amount, presence: true, numericality: {greater_than: 0}
  validates :status, presence: true
  validates :last_four_digits, presence: true, length: {is: 4}

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
    # Set payment attributes.
    self.amount = self.application.calculate_fee
    self.type = :credit_card
    self.last_four_digits = credit_card.last_digits
    self.status = :authorized

    # Take payment
    card = credit_card
    if card_valid?(card) and valid? and authorize_payment card
      save! # We save payment whether it authorized or not.
      return authorized? # Result auth result.
    end

    false # validation error or auth failed.
  end

  # Checks if the application has a successful payment
  #
  # * +application+ - the application to check
  #
  # Returns - a boolean indicating if a successful payment exists.
  def self.has_paid?(application)
    application.payments.where(status: :authorized).any?
  end

  # Checks if the application has a failed payment
  #
  # * +application+ - the application to check
  #
  # Returns - a boolean indicating if a failed payment exists.
  def self.has_failed_payment?(application)
    application.payments.where(status: :failed).any?
  end

  # Finds an authorized payment
  #
  # * +application+ - the application to find the payment for.
  #
  # Returns - the payment, if it exists.
  def find_authorized_payment(application)
    application.payments.find_by_status(:authorized)
  end

  private
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
    # Returns - a boolean indicating if the payment was authorized.
    def authorize_payment(card)
      # Check if this application has already been paid for (just to be safe).
      if Payment::has_paid? application
        errors.add(:payment, 'for this application has already been received.')
        return false
      end

      response = Payment::gateway.purchase(self.amount, card)
      unless response.success?
        self.status = :failed
        self.errors.add(:credit_card, response.message) # Add auth failed message.
      end

      true
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
      ActiveMerchant::Billing::Base.mode = :test
      ActiveMerchant::Billing::BraintreeGateway.new(
          :merchant_id => ENV['BRAINTREE_MERCHANT_ID'],
          :public_key  => ENV['BRAINTREE_PUBLIC_KEY'],
          :private_key => ENV['BRAINTREE_PRIVATE_KEY']
      )
    end
end
