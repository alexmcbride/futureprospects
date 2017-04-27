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
      # Take payment
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
  # you can do it manually `ruby bin\rake site_tasks:handle_failed_payments`, on Heroku it is run by the scheduler once
  # every 24 hours. See for more details: https://devcenter.heroku.com/articles/scheduler
  def self.handle_failed_payments
    # Gets all applications (eager loading students), that are still sitting at submitted, and have at least one failed
    # payment over 7 days old.
    applications = Application.includes(:student)
                       .where(status: :payment_failed)
                       .where(id: Payment.where(status: :failed).where("created_at < CURRENT_DATE - INTERVAL '#{PAYMENT_EXPIRY_DAYS} days'"))

    # Cancel application and emails student.
    applications.each do |application|
      application.cancel
      StudentMailer.application_cancelled(application.student, application)
    end
  end

  private
    # Called when authentication is successful.
    def handle_auth_success
      self.status = :authorized
      self.save!
      self.application.update_status :paid
      self.send_payment_received_email
    end

    # Called when authentication fails.
    def handle_auth_failed
      self.status = :failed
      self.save! # We save payment even if failed.
      self.application.update_status :payment_failed
      self.errors.add(:authentication, 'failed for this payment.')
      self.send_payment_failed_email
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

    # Takes a payment using the card details.
    #
    # Returns - true if the payment authorization was processed, false if payment has already been mad.e
    def authorize_payment(card)
      # Check if this application has already been paid for (just to be safe).
      if has_paid?
        return :already_paid
      end

      response = Payment::gateway.purchase(self.amount, card)
      response.success? ? :auth_success : :auth_failed
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
