# Model class to represent a payment.
class Payment < ApplicationRecord
  # The number of days until a payment expires.
  PAYMENT_EXPIRY_DAYS = 7

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
  validates :last_four_digits, presence: false
  validates :card_holder, presence: false

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
    if has_paid?
      self.errors.add(:payment, 'for this application has already been received.')
      return false
    end

    # Set some general payment options.
    self.amount = self.application.calculate_fee
    self.status = :failed # default

    # Take correct payment depending on type.
    result = nil
    if self.credit_card?
      result = authorize_credit_card
    elsif self.paypal?
      result = authorize_paypal
    end

    # Check result.
    if result == :auth_failed
      handle_auth_failed
    elsif result == :auth_success
      handle_auth_success
      return true
    end
    false
  end

  # Updates payment with info from PayPal token.
  #
  # * +token+ - the token given to us by PayPal.
  def update_from_token(token)
    details = PAYPAL_GATEWAY.details_for token
    @paypal_payer_id = details.payer_id
    @paypal_token = token
  end

  # Checks if the application has a successful payment
  #
  # Returns - a boolean indicating if a successful payment exists.
  def has_paid?
    self.application.payments.where(status: :authorized).any?
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

  # Gets when this payment will expire.
  #
  # Returns - the expiry datetime object.
  def expiry_time
    self.created_at + PAYMENT_EXPIRY_DAYS.days
  end

  # Method called by rake task that cancels any applications with an outstanding payment over 7 days old. To run this
  # you can do it manually `ruby bin\\rake site_tasks:handle_failed_payments`, on Heroku it is run by the scheduler once
  # every 24 hours. See for more details: https://devcenter.heroku.com/articles/scheduler
  def self.handle_failed_payments
    applications = Application.includes(:student)
                       .where(status: :payment_failed)
                       .where(id: Payment.where(status: :failed).where("created_at < CURRENT_DATE - INTERVAL '#{PAYMENT_EXPIRY_DAYS} days'"))

    # Cancel application and emails student.
    applications.each do |application|
      application.cancel
      StudentMailer.application_cancelled(application.student, application)
    end
  end

  # Sets up a PayPal payment with the specified params
  #
  # * +amount+ - the amount to charge the student
  # * +ip+ - the buyer's IP address
  # * +return_url+ - the URL the buyer is returned to. This URL then needs to call authorize.
  # * +cancel_url+ - the URL the buyer is returned to, if they cancel their PayPal purchase.
  #
  # Returns - the PayPal URL to direct to the buyer to.
  def self.setup_paypal(amount, ip, return_url, cancel_url)
    response = PAYPAL_GATEWAY.setup_purchase(amount,
                                             ip: ip,
                                             return_url: return_url,
                                             cancel_return_url: cancel_url,
                                             currency: Payment::CURRENCY,
                                             allow_guest_checkout: true,
                                             items: [{name: 'Future Prospects', description: 'Application fee', quantity: 1, amount: amount}])
    PAYPAL_GATEWAY.redirect_url_for response.token
  end

  private
    # Authorizes a credit/debit card payment with BrainTree
    def authorize_credit_card
      # Set this model's attributes so it can be saved.
      self.last_four_digits = credit_card.last_digits
      self.card_holder = "#{card_first_name} #{card_last_name}"

      # Take payment if card and model are valid.
      card = credit_card
      if card_valid?(card) and valid?
        # Take payment
        response = BRAINTREE_GATEWAY.purchase(self.amount, card)
        puts "BrainTree Response: #{response.inspect}"
        return response.success? ? :auth_success : :auth_failed
      end

      :payment_invalid
    end

    # Authorizes a payment with PayPal.
    def authorize_paypal
      if valid?
        response = PAYPAL_GATEWAY.purchase(self.amount, currency: CURRENCY, ip: @remote_ip, token: @paypal_token, payer_id: @paypal_payer_id)
        puts "PayPal Response: #{response.inspect}"
        return response.success? ? :auth_success : :auth_failed
      end

      :payment_invalid
    end

    # Called when authentication is successful.
    def handle_auth_success
      self.status = :authorized
      self.save!
      self.application.update_status :paid
      send_payment_received_email
    end

    # Called when authentication fails.
    def handle_auth_failed
      self.status = :failed
      self.save! # We save payment even if failed.
      self.application.update_status :payment_failed
      self.errors.add(:authentication, 'failed for this payment.')
      send_payment_failed_email
    end

    # Sends a payment confirmation email to the student who made the payment.
    def send_payment_received_email
      StudentMailer.payment_received(application.student, self).deliver_later
    end

    # Sends a payment failed email to the student who made the payment.
    def send_payment_failed_email
      StudentMailer.payment_failed(application.student, self).deliver_later
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
