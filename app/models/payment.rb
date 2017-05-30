# * Name: Alex McBride
# * Date: 25/05/2017
# * Project: Future Prospects
# * Model class to represent a payment
class Payment < ApplicationRecord
  # The currency to use for the payments.
  CURRENCY = 'GBP'

  # Imports
  require 'active_merchant'
  require 'active_merchant/billing/rails'

  # @!attribute status
  #   @return [symbol]
  #   Enum for payment status.
  #
  #   * +:authorized+ - the payment was successfully authorized.
  #   * +:failed+ - the payment authorization failed.
  enum status: [:authorized, :failed]

  # @!attribute status
  #   @return [symbol]
  #   Enum for payment type.
  #
  #   * +:credit_card+ - a braintree credit card payment.
  #   * +:paypal+ - a paypal payment.
  enum payment_type: [:credit_card, :paypal]

  # @!attribute card_brands
  #   @return [symbol]
  #   Enum for card brands.
  #
  #   * +:visa+ - a visa card payment.
  #   * +:mastercard+ - a mastercard payment.
  enum card_brands: [:visa, :mastercard]

  # @!attribute application
  #   @return [Application]
  #   The payment's parent application.
  belongs_to :application

  # Validators
  validates :payment_type, presence: false
  validates :amount, presence: true, numericality: {greater_than: 0}
  validates :status, presence: false
  validates :description, presence: true
  validate :validate_card_details, if: :credit_card?

  # @!attribute id
  #   @return [Fixnum]
  #   The payment ID.

  # @!attribute application_id
  #   @return [Fixnum]
  #   The application that the payment is for.

  # @!attribute amount
  #   @return [Fixnum]
  #   The amount of the payment in pence.

  # @!attribute last_four_digits
  #   @return [String]
  #   The last four digits of the credit card number.

  # @!attribute card_holder
  #   @return [String]
  #   The name of the card holder.

  # @!attribute description
  #   @return [String]
  #   A description of the payment.

  # @!attribute paid_at
  #   @return [DateTime]
  #   The date and time the payment was made.

  # @!attribute updated_at
  #   @return [DateTime]
  #   The last update time.

  # @!attribute card_brand
  #   @return [Symbol]
  #   the card brand (e.g. +:visa+, +:mastercard+ etc).
  attr_accessor :card_brand

  # @!attribute card_number
  #   @return [String]
  #   The credit card number.
  attr_accessor :card_number

  # @!attribute card_cvv
  #   @return [String]
  #   The credit card vericiation code.
  attr_accessor :card_cvv

  # @!attribute card_expiry
  #   @return [String]
  #   The credit card expiry date.
  attr_accessor :card_expiry

  # @!attribute card_first_name
  #   @return [String]
  #   The card holder's first name
  attr_accessor :card_first_name

  # @!attribute card_last_name
  #   @return [String]
  #   The card holder's last name
  attr_accessor :card_last_name

  # @!attribute remote_ip
  #   @return [String]
  #   The remote IP of the payer (needed by PayPal).
  attr_accessor :remote_ip

  # @!attribute paypal_payer_id
  #   @return [String]
  #   The payers PayPal ID.
  attr_accessor :paypal_payer_id

  # @!attribute paypal_token
  #   @return [String]
  #   The token returned by PayPal.
  attr_accessor :paypal_token

  # @!attribute simulate_authentication_error
  #   @return [String]
  #   Set this variable to simulate an authentication error through Braintree.
  attr_accessor :simulate_authentication_error

  # Authorizes the payment with the relevant provider.
  #
  # @return [Boolean] true if the payment was authorized.
  def authorize
    # Take correct payment depending on type.
    response = if self.paypal?
                 paypal_purchase
               elsif self.credit_card?
                 credit_card_purchase
               else
                 raise 'Unknown payment type'
               end
    puts "Payment Response: #{response.inspect}" # Debug message.

    # Handle response.
    if response.success?
      self.status = :authorized
    else
      self.status = :failed
      self.errors.add(:authentication, response.message)
    end

    # We always save, whether it was successful or not.
    self.paid_at = DateTime.now
    self.save! validate: false
    response.success?
  end

  # Generates a PayPal payment URL with the specified params.
  #
  # @param ip [String] the buyer's IP address
  # @param return_url [String] the URL the buyer is returned to. This return action then needs to call authorize.
  # @param cancel_url [String] the URL the buyer is returned to, if they cancel their PayPal purchase.
  # @return [String] the PayPal URL to direct to the buyer to.
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
  # @param token [String] the token given to us by PayPal.
  def update_from_paypal(token)
    if self.paypal?
      details = PAYPAL_GATEWAY.details_for token
      @paypal_payer_id = details.payer_id
      @paypal_token = token
    end
  end

  # Gets the amount paid in pounds
  #
  # @return [Fixnum] the amount in pounds.
  def amount_pounds
    amount / 100
  end

  # Checks if the specified application 'owns' this payment.
  #
  # @param application [Application] the application to check.
  # @return [Boolean] true if the application owns it, otherwise false.
  def owner?(application)
    application_id == application.id
  end

  # Creates a PDF invoice for the payment.
  #
  # @param context [ActionView::Base] the context to use (for calling helpers)
  # @return [PdfPayment]
  def to_pdf(context)
    PaymentPdf.new self, context
  end

  private
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
    # @return [ActiveMerchant::Response]
    def credit_card_purchase
      card = credit_card
      self.last_four_digits = card.last_digits
      self.card_holder = "#{card_first_name} #{card_last_name}"
      amount = self.simulate_authentication_error == '1' ? 200100 : self.amount
      BRAINTREE_GATEWAY.purchase(amount, card)
    end

    # Makes a PayPal purchase
    #
    # @return [ActiveMerchant::Response]
    def paypal_purchase
      PAYPAL_GATEWAY.purchase(self.amount,
                              currency: CURRENCY,
                              ip: @remote_ip,
                              token: @paypal_token,
                              payer_id: @paypal_payer_id)
    end

    # Creates a new CreditCard object from the options.
    #
    # @return [ActiveMerchant::CreditCard] a new credit card object, or nil if the object wasn't built.
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
    # @param expiry [String ]the string to parse (format: mm/yyyy).
    # @return [(Fixnum, Fixnum)] a tuple with (month, year) as integers.
    def self.try_parse_expiry(expiry)
      begin
        expiry = Date.strptime expiry, '%m/%Y'
        [expiry.month, expiry.year]
      rescue ArgumentError, TypeError
        [0, 0]
      end
    end
end