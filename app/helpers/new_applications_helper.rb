module NewApplicationsHelper
  # Outputs a text field with bootstrap style
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

  # Outputs an email field with bootstrap style
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

  # Outputs a select control with bootstrap style
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
