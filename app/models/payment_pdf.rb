# Class to represent a PDF payment invoice. Inherits from Prawn PDF generator's Document class.
class PaymentPdf < Prawn::Document
  include ActionView::Helpers::NumberHelper

  # Constructor.
  #
  # * +payment+ - the payment class.
  # * +context+ - a view context, for calling helpers.
  # * +options+ - options to pass to Prawn.
  # * +&block+ - block to pass to Prawn.
  #
  def initialize(payment, context, options={}, &block)
    super options, &block
    Prawn::Font::AFM.hide_m17n_warning = true # disable font warnings
    create_pdf payment, context
  end

  # Gets the filename of the file.
  #
  # Returns - the filename string.
  def filename
    'future_prospects_invoice.pdf'
  end

  # Gets the mime-type of the file.
  #
  # Returns - the mime-type string.
  def mime_type
    'application/pdf'
  end

  private
    # Creates the PDF file based on the payment.
    def create_pdf(payment, context)
      text '<b><u>Future Prospects</u></b>', size: 18, inline_format: true
      text ' '
      text 'This invoice confirms that the following payment has been received:'
      text ' '
      text 'Amount: ' + number_to_currency(payment.amount_pounds, unit: '£')
      text 'Description: ' + payment.description
      text 'Payment Type: ' + payment.payment_type.humanize
      text 'Payment Date: ' + context.format_date(payment.paid_at)
      if payment.credit_card?
        text 'Card Holder: ' + payment.card_holder
        text 'Card Number: ' + context.credit_card_number(payment.last_four_digits)
      end
      text 'Status: ' + payment.status.humanize
    end
end