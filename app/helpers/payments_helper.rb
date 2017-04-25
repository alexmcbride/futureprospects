module PaymentsHelper
  CARD_VALUES = {'visa' => :visa, 'mastercard' => :master}

  def card_options(payment)
    options_for_select(Payment::card_brands.map {|k, v| [k.humanize, CARD_VALUES[k]] }, payment.card_brand)
  end
end
