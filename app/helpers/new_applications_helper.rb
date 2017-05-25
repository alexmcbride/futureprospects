# * Name: Alex McBride
# * Date: 24/05/2017
# * Project: Future Prospects
# Module to define HTML helpers for the applications section.
module NewApplicationsHelper
  # Outputs a text field with bootstrap style
  #
  # @param form [ActionView::Helpers::FormHelper] the form to add the text field to
  # @param item [Symbol] the item (e.g. :title) to add.
  # @param args [Hash] various options hash.
  # @return [String]
  def form_text_field(form, item, args={})
    label = args[:label]
    label_col = (args[:label_col] or 4)
    input_col = (args[:input_col] or 8)
    content_tag(:div, class: 'form-group') do
      concat(form.label(item, label, class: "control-label col-xs-#{label_col}"))
      concat(content_tag(:div, class: "col-xs-#{input_col}") do
        concat(form.text_field(item, class: 'form-control'))
      end)
    end
  end

  # Outputs a text field with bootstrap style marked as disabled.
  #
  # @param name [Symbol] the name of the field.
  # @param value [String] the value of the field.
  # @param label [String] the label to display next to the field.
  # @return [String]
  def form_disabled_field(name, value, label)
    content_tag(:div, class: 'form-group') do
      concat(label_tag(name, label, class: 'control-label col-xs-4'))
      concat(content_tag(:div, class: 'col-xs-8') do
        concat(text_field_tag(name, value, class: 'form-control', disabled: true))
      end)
    end
  end

  # Outputs an email field with bootstrap style
  #
  # @param form [ActionView::Helpers::FormHelper] the form to add the email field to
  # @param item [Symbol] the item (e.g. :title) to add.
  # @param args [Hash] various options hash.
  # @return [String]
  def form_email_field(form, item, args={})
    label = args[:label]
    label_col = (args[:label_col] or 4)
    input_col = (args[:input_col] or 8)
    content_tag(:div, class: 'form-group') do
      concat(form.label(item, label, class: "control-label col-xs-#{label_col}"))
      concat(content_tag(:div, class: "col-xs-#{input_col}") do
        concat(form.email_field(item, class: 'form-control'))
      end)
    end
  end



  # Outputs a select control with bootstrap style.
  #
  # @param form [ActionView::Helpers::FormHelper] the form to add the select field to.
  # @param item [Symbol] the item (e.g. :title) to add.
  # @param choices [Array] the select fields options.
  # @param args [Hash] various options hash.
  #
  # Returns  - HTML
  def form_select(form, item, choices, args={})
    label = args[:label]
    label_col = (args[:label_col] or 4)
    input_col = (args[:input_col] or 8)
    content_tag(:div, class: 'form-group') do
      concat(form.label(item, label, class: "control-label col-xs-#{label_col}"))
      concat(content_tag(:div, class: "col-xs-#{input_col}") do
        concat(form.select item, choices, {}, {:class => 'form-control full-width'})
      end)
    end
  end

  # Outputs a date field with bootstrap style
  #
  # @param form [ActionView::Helpers::FormHelper] the form to add the date field to.
  # @param item [Symbol] the item (e.g. :title) to add.
  # @param args [hash] various options hash.
  #
  # Returns  - HTML
  def form_date(form, item, args={})
    label = args[:label]
    label_col = (args[:label_col] or 4)
    input_col = (args[:input_col] or 8)
    value = args[:value]
    content_tag(:div, class: 'form-group') do
      concat(form.label(item, label, class: "control-label col-xs-#{label_col}"))
      concat(content_tag(:div, class: "col-xs-#{input_col}") do
        concat(form.text_field(item, value: value, class: 'form-control datepicker-field', 'data-provide' => 'datepicker', placeholder: 'dd/mm/yyyy' ))
      end)
    end
  end
end
