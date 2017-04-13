module ApplicationHelper
  @renderer = nil
  @markdown = nil

  # Helper function for flash_messages.
  def bootstrap_class_for(flash_type)
    { notice: 'alert-success', alert: 'alert-warning', success: 'alert-success', error: 'alert-danger', warning: 'alert-warning'}[flash_type.to_sym]
  end

  # Displays any flash messages in a bootstrap compatible way.
  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "text-center alert #{bootstrap_class_for(msg_type)} fade in") do
        concat content_tag(:button, 'x'.html_safe, class: 'close', data: {dismiss: 'alert'})
        concat message
      end)
      flash.clear
    end
    nil
  end

  # Displays form errors in a nice bootstrap way
  def form_errors(obj)
    if obj.errors.any?
      content_tag(:div, class: 'panel panel-danger') do
        concat(content_tag(:div, class: 'panel-heading') do
          concat(content_tag(:h4, class: 'panel-title') do
            concat "#{pluralize(obj.errors.count, 'error')} prohibited this action from being completed:"
          end)
        end)
        concat(content_tag(:div, class: 'panel-body') do
          concat(content_tag(:ul) do
            obj.errors.full_messages.each do |msg|
              concat content_tag(:li, msg)
            end
          end)
        end)
      end
    end
  end

  # Returns the specified text as markdown.
  def markdown(text)
    options = {
        filter_html:     true,
        hard_wrap:       true,
        link_attributes: { rel: 'nofollow', target: '_blank'},
        space_after_headers: true,
        fenced_code_blocks: true
    }

    extensions = {
        autolink:           true,
        superscript:        true,
        disable_indented_code_blocks: true
    }

    # Create if they don't exist.
    @renderer ||= Redcarpet::Render::HTML.new(options)
    @markdown ||= Redcarpet::Markdown.new(@renderer, extensions)

    @markdown.render(text).html_safe
  end

  # Removes the http:// bit from the start of URLs
  def clean_url(url)
    (URI.split url).compact.slice(1, 1).join
  end

  # Generates HTML for a list-item on the stages sidebar.
  def stage_item(name, path, selected=false, completed=false)
    if selected
      content_tag(:a, href: url_for(path), class: 'list-group-item active') do
        concat(content_tag(:div, class: 'row') do
          concat(content_tag(:div, name, class: 'col-xs-10'))
          concat(content_tag(:div, class: 'col-xs-2') do
            concat(content_tag(:i, '', class: 'fa fa-arrow-circle-right app-arrow'))
          end)
        end)
      end
    else
      content_tag(:a, href: url_for(path), class: 'list-group-item') do
        concat(content_tag(:div, class: 'row') do
          concat(content_tag(:div, name, class: 'col-xs-10'))
          if completed
            concat(content_tag(:div, class: 'col-xs-2') do
              concat(content_tag(:i, '', class: 'fa fa-check-circle app-tick'))
            end)
          end
        end)
      end
    end
  end

  # Formats a date as dd/mm/yyyy
  def format_date(date)
    date.strftime '%d/%m/%Y' if date
  end

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

  # Gets any current user
  def current_user
    current_student or current_staff
  end

  # Gets if any user is signed in
  def user_signed_in?
    student_signed_in? or staff_signed_in?
  end

  # Switches the dir sort param back and forward
  def toggle_sort(dir)
    if not dir or dir == 'asc'
      'desc'
    else
      'asc'
    end
  end

  # The path for filtering the staff course table.
  def course_table_filter_path(sort, params)
    staff_courses_path(sort: sort, dir: toggle_sort(params[:dir]), page: params[:page], title: params[:title], category: params[:category], status: params[:status])
  end
end
