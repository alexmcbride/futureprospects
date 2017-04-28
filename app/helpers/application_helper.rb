# Module for application wide helpers. These are functions that can be called in views.
module ApplicationHelper
  # Markdown rendered
  @@renderer = nil

  # Markdown object.
  @@markdown = nil

  # Determines the type of bootstrap class to use for the alert.
  #
  # * +flash_type+ - the type of flash message.
  #
  # Returns - the bootstrap class to use e.g. warning, success etc.
  def bootstrap_class_for(flash_type)
    { notice: 'alert-success',
      alert: 'alert-warning',
      success: 'alert-success',
      error: 'alert-danger',
      warning: 'alert-warning',
      recaptcha_error: 'alert-danger' }[flash_type.to_sym]
  end

  # Displays any queued flash messages in a bootstrap friendly way.
  #
  # Returns - the HTML for a pretty bootstrap alert contaning the flash message.
  def flash_messages
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "text-center alert #{bootstrap_class_for(msg_type)} fade in") do
        concat content_tag(:button, 'x'.html_safe, class: 'close', data: {dismiss: 'alert'})
        concat message
      end)
      flash.clear
    end
    nil
  end

  # Helper to dsplay form errors in a nice pretty bootstrap compatible way.
  #
  # * +obj+ - the form to show error for.
  #
  # Returns - HTML with pretty bootstrap errors.
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

  # Converts the specified text into markdown.
  #
  # * +text+ - the text to convert.
  #
  # Returns - the HTML the markdown was converted to.
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
    @@renderer ||= Redcarpet::Render::HTML.new(options)
    @@markdown ||= Redcarpet::Markdown.new(@@renderer, extensions)

    @@markdown.render(text).html_safe
  end

  # Removes the http:// bit from the start of URLs
  #
  # * +url+ - the url to process.
  #
  # Returns - a clean URL string.
  def clean_url(url)
    (URI.split url).compact.slice(1, 1).join
  end

  # Generates HTML for a list-item on the stages sidebar.
  #
  # * +name+ - the name of the stage.
  # * +path+ - the path to the stage (url).
  # * +selected+ - optional boolean to indicate if the stage is selected (active).
  # * +completed+ - optional boolean to indicate if the stage is completed (green tick).
  #
  # Returns - the HTML of the item.
  def stage_item(name, path, stage, current)
    selected = stage == current
    completed = Application.stage_complete?(stage, current)
    if completed
      link_to(path, class: "list-group-item#{' active' if selected}") do
        if selected
          concat(icon('arrow-circle-right', class: 'pull-right app-arrow'))
        elsif completed
          concat(icon('check-circle', class: 'pull-right app-tick'))
        end
        concat(name)
      end
    else
      content_tag(:div, class: "list-group-item#{' active' if selected}") do
        if selected
          concat(icon('arrow-circle-right', class: 'pull-right app-arrow'))
        elsif completed
          concat(icon('check-circle', class: 'pull-right app-tick'))
        end
        concat(name)
      end
    end
  end

  def credit_card_number(last_four_digits)
    ((('X' * 4) + '-') * 3) + last_four_digits
  end

  # Formats a date as dd/mm/yyyy.
  #
  # * +date+ - the date to format.
  #
  # Returns - the formatted date.
  def format_date(date)
    date.strftime '%d/%m/%Y' if date
  end

  def format_expiry(date)
    date.strftime '%m/%y' if date
  end

  # Formats a datetime as dd/mm/yyyy - H:m.
  #
  # * +date+ - the datetime to format.
  #
  # Returns - the formatted datetime.
  def format_datetime(dt)
    dt.strftime '%d/%m/%Y - %H:%m' if dt
  end

  # Gets any current user
  #
  # Returns - the current user.
  def current_user
    current_student or current_staff
  end

  # Gets if any user is signed in
  #
  # Returns - true if the user is signed in.
  def user_signed_in?
    student_signed_in? or staff_signed_in?
  end

  # Adds the little markdown guide ? thing next to some text fields
  #
  # Returns - HTML for the little markdown guide thing.
  def markdown_support_text
    content_tag(:div, class: 'pull-right text-darkish small', style: 'margin-top: 5px;') do
      concat(icon('arrow-circle-down'))
      concat(' Markdown ')
      concat(link_to '(?)', 'https://daringfireball.net/projects/markdown/basics', class: 'help-cursor', title: 'Markdown Guide')
    end
  end
end
