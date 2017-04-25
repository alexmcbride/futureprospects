module PaymentsHelper
  # Helper method for getting card symbol from string
  #
  # * +value+ - card value
  #
  # Returns - a symbol that can be used to set payment brand type.
  def card_values(value)
    if value == 'visa'
      :visa
    elsif value == 'mastercard'
      :master
    end
  end

  # Creates card brand select field options
  #
  # * +payment+ - the payment type
  #
  # Returns - the card options HTML.
  def card_options(payment)
    options = options_for_select(Payment::card_brands.map {|k, v| [k.humanize, card_values(k)] }, payment.card_brand)
    "<option disabled=\"disabled\"#{ 'selected="selected"' unless payment.card_brand}>-- Choose --</option>".html_safe + options
  end
end
