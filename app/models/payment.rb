# Model class to represent a payment.
class Payment < ApplicationRecord
  # The currency to use for the payments.
  CURRENCY = 'GBP'

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
  validates :description, presence: true
  validate :validate_card_details, if: :credit_card?

  # Callbacks
  before_validation :set_default_status

  # The card brand (e.g. visa, mastercard etc).
  attr_accessor :card_brand

  # The card number.
  attr_accessor :card_number

  # The card verification number
  attr_accessor :card_cvv

  # The expiry date
  attr_accessor :card_expiry

  # The card holder's first name
  attr_accessor :card_first_name

  # The card holder's last name
  attr_accessor :card_last_name

  # The remote IP of the payer.
  attr_accessor :remote_ip

  # The payers PayPal ID
  attr_accessor :paypal_payer_id

  # The token returned by PayPal.
  attr_accessor :paypal_token

  # Authorizes a payment using the card details.
  #
  # Returns - a boolean indicating if the payment was authorized.
  def authorize
    # Take correct payment depending on type.
    if self.paypal?
      response = paypal_purchase
    else
      response = credit_card_purchase
    end

    # Debug message.
    puts "Payment Response: #{response.inspect}"

    # Handle response.
    if response.success?
      self.status = :authorized
      self.save!
      true
    else
      self.status = :failed
      self.save!
      self.errors.add(:authentication, response.message)
      false
    end
  end

  # Generates a PayPal payment URL with the specified params.
  #
  # * +amount+ - the amount to charge the student
  # * +ip+ - the buyer's IP address
  # * +return_url+ - the URL the buyer is returned to. This return action then needs to call authorize.
  # * +cancel_url+ - the URL the buyer is returned to, if they cancel their PayPal purchase.
  #
  # Returns - the PayPal URL to direct to the buyer to.
  def generate_paypal_url(ip, return_url, cancel_url)
    items = {name: 'Future Prospects',
             description: description,
             quantity: 1,
             amount: amount}

    options = {ip: ip,
               return_url: return_url,
               cancel_return_url: cancel_url,
               currency: Payment::CURRENCY,
               allow_guest_checkout: true,
               items: [items]}

    response = PAYPAL_GATEWAY.setup_purchase(amount, options)
    PAYPAL_GATEWAY.redirect_url_for response.token
  end

  # Updates payment with info from PayPal token.
  #
  # * +token+ - the token given to us by PayPal.
  def update_from_paypal(token)
    if self.paypal?
      details = PAYPAL_GATEWAY.details_for token
      @paypal_payer_id = details.payer_id
      @paypal_token = token
    end
  end

  # Checks if a payment_type is valid.
  #
  # * +payment_type+ - the payment type to test
  #
  # Returns - true if the payment type is valid.
  def self.valid_payment_type?(payment_type)
    %w(credit_card paypal).include? payment_type
  end

  # Gets the amount paid in pounds
  #
  # Returns - the amount in pounds.
  def amount_pounds
    amount / 100
  end

  # Checks if the specified application 'owns' this payment.
  #
  # * +application+ - the application to check.
  #
  # Returns - true if the application owns it, otherwise false.
  def owner?(application)
    application_id == application.id
  end

  private
  # Called before validation, defaults payment to failed.
  def set_default_status
    if self.status.nil?
      self.status = :failed
    end
  end

  # Custom validator to check cc details are correct.
  def validate_card_details
    card = credit_card

    unless card.valid?
      # Add card errors to this model, so errors gets displayed in form.
      card.errors.each {|k, v| errors.add(k, v[0])}
    end
  end

  # Makes a credit card purchase
  #
  # Returns - an ActiveMerchant Response object
  def credit_card_purchase
    card = credit_card
    self.last_four_digits = card.last_digits
    self.card_holder = "#{card_first_name} #{card_last_name}"
    BRAINTREE_GATEWAY.purchase(self.amount, card)
  end

  # Makes a PayPal purchase
  #
  # Returns - an ActiveMerchant Response object
  def paypal_purchase
    PAYPAL_GATEWAY.purchase(self.amount,
                            currency: CURRENCY,
                            ip: @remote_ip,
                            token: @paypal_token,
                            payer_id: @paypal_payer_id)
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
end