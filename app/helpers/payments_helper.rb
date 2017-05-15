# Module to define helpers for the payments controller.
module PaymentsHelper
  # Helper method for getting card symbol from string
  #
  # * +value+ - card value
  #
  # Returns a symbol that can be used to set payment brand type.
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
  # Returns the card options HTML.
  def card_options(payment)
    options = options_for_select(Payment::card_brands.map {|k, v| [k.humanize, card_values(k)] }, payment.card_brand)
    "<option disabled=\"disabled\"#{ 'selected="selected"' unless payment.card_brand}>-- Choose --</option>".html_safe + options
  end

  # Payments stage item HTML.
  #
  # * +value+ - the value of the item
  # * +selected+ - whether the item is selected or not.
  #
  # Returns the HTML to display the item.
  def payment_stage_item(value, selected=false, completed=false)
    if selected
      content_tag(:li, class: 'list-group-item active') do
        concat(content_tag(:div, class: 'row') do
          concat(content_tag(:div, class: 'col-xs-10') do
            concat(value)
          end)
          concat(content_tag(:div, class: 'col-xs-2 text-right') do
            concat(icon('arrow-circle-right', class: 'app-arrow'))
          end)
        end)
      end
    else
      content_tag(:li, class: 'list-group-item') do
        concat(content_tag(:div, class: 'row') do
          concat(content_tag(:div, class: 'col-xs-10') do
            concat(value)
          end)
          if completed
            concat(content_tag(:div, class: 'col-xs-2 text-right') do
              concat(icon('check', class: 'app-tick'))
            end)
          end
        end)
      end
    end
  end
end
