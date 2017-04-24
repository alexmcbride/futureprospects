# Model class to represent a payment.
class Payment < ApplicationRecord
  require 'active_merchant'
  require "active_merchant/billing/rails"

  enum status: [:authorized, :failed]
  enum type: [:credit_card, :paypal]
  enum card_brands: [:visa, :mastercard]

  belongs_to :application

  validates :type, presence: true
  validates :amount, presence: true, numericality: {greater_than: 0}
  validates :status, presence: true
  validates :last_four_digits, presence: true, length: {is: 4}

  attr_accessor :card_brand
  attr_accessor :card_number
  attr_accessor :card_cvv
  attr_accessor :card_expiry
  attr_accessor :card_first_name
  attr_accessor :card_last_name

  # Checks if the current card details are valid
  #
  # Returns - a boolean indicating if the details are valid.
  def card_valid?
    cc = credit_card
    if cc.nil?
      return false
    end
    if cc.valid?
      return true
    end
    cc.errors.each {|k, v| self.errors.add(k, v[0])}
    false
  end

  # Takes a payment using the card details.
  def take_payment
    self.amount = self.application.calculate_fee
    self.type = :credit_card
    self.last_four_digits = credit_card.last_digits
    self.status = :authorized

    if valid?
      # Take payment
      response = gateway.purchase(self.amount, credit_card)
      unless response.success?
        puts response.inspect
        self.status = :failed
        self.errors.add(:credit_card, response.message)
      end
      save validate: false
    end
  end

  # Authorizes a payment using the card details.
  #
  # Returns - a boolean indicating if the payment was authorized.
  def authorize
    # Check if payment has already been received.
    if self.application.has_successful_payment
      self.errors.add(:authorization, 'for this payment has already been received.')
      return false
    end

    # Check card and take payment.
    if card_valid?
      take_payment
      return authorized?
    end

    false
  end

  private
    # Creates a new CreditCard object from the options.
    #
    # Returns - a new credit card object, or nil if the object wasn't built.
    def credit_card
      begin
        expiry = Date.strptime card_expiry, '%m/%Y'
        ActiveMerchant::Billing::CreditCard.new(
            brand: card_brand,
            number: card_number,
            verification_value: card_cvv,
            month: expiry.month,
            year: expiry.year,
            first_name: card_first_name,
            last_name: card_last_name
        )
      rescue ArgumentError
        self.errors.add(:card_expiry, 'is not a valid date')
        nil
      end
    end

    # Creates a new gateway object, for taking a payment
    #
    # Returns - a new GateWay object, in test mode.
    def gateway
      ActiveMerchant::Billing::Base.mode = :test
      ActiveMerchant::Billing::BraintreeGateway.new(
          :merchant_id => ENV['BRAINTREE_MERCHANT_ID'],
          :public_key  => ENV['BRAINTREE_PUBLIC_KEY'],
          :private_key => ENV['BRAINTREE_PRIVATE_KEY']
      )
    end
end
