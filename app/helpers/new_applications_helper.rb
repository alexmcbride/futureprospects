# Module to define HTML helpers for the applications section.
module NewApplicationsHelper
  # Outputs a text field with bootstrap style
  #
  # * +form+ - the form to add the text field to
  # * +item+ - the item (e.g. :title) to add.
  # * +args+ - various options hash.
  #
  # Returns  - HTML
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

  # Outputs an emal field with bootstrap style
  #
  # * +form+ - the form to add the email field to
  # * +item+ - the item (e.g. :title) to add.
  # * +args+ - various options hash.
  #
  # Returns  - HTML
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
  # * +form+ - the form to add the select field to.
  # * +item+ - the item (e.g. :title) to add.
  # * +choices+ - the select fields options.
  # * +args+ - various options hash.
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
  # * +form+ - the form to add the date field to.
  # * +item+ - the item (e.g. :title) to add.
  # * +args+ - various options hash.
  #
  # Returns  - HTML
  def form_date(form, item, args={})
    label = args[:label]
    label_col = (args[:label_col] or 4)
    input_col = (args[:input_col] or 8)
    content_tag(:div, class: 'form-group') do
      concat(form.label(item, label, class: "control-label col-xs-#{label_col}"))
      concat(content_tag(:div, class: "col-xs-#{input_col}") do
        concat(form.text_field(item, class: 'form-control datepicker-field', 'data-provide' => 'datepicker', placeholder: 'dd/mm/yyyy' ))
      end)
    end
  end
end
