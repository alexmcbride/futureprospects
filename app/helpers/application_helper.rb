# * Name: Alex McBride
# * Date: 24/05/2017
# * Project: Future Prospects
# Module for application wide helpers. These are functions that can be called in views.
module ApplicationHelper
  # Class variable to hold the markdown renderer.
  @@renderer = nil

  # Class variable to hold the markdown object.
  @@markdown = nil

  # Determines the type of bootstrap class to use for the alert.
  #
  # @param flash_type [Symbol] the type of flash message.
  #
  # @return [String] the bootstrap class to use e.g. warning, success etc.
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
  # @return [String] the HTML for a pretty bootstrap alert containing the flash message.
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

  # Helper to display form errors in a nice pretty bootstrap compatible way.
  #
  # @param obj [ActiveRecord::Resource] the model object to show error for.
  # @return [String] the HTML with pretty bootstrap errors.
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
  # @param text [String] the text to convert.
  #
  # @return [String] the HTML that the markdown was converted to.
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

  # Removes the http:// bit from the start of URLs.
  #
  # @param url [String] the url to process.
  # @return [String] the clean URL string.
  def clean_url(url)
    (URI.split url).compact.slice(1, 1).join
  end

  # Generates HTML for a list-item on the application stages sidebar.
  #
  # @param name [String] the name of the stage.
  # @param path [String] the path to the stage (url).
  # @param stage [Symbol] the stage the application is at.
  # @param current [Symbol] the stage the student is viewing.
  # @return [String] the HTML of the item.
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

  # Returns a masked credit card number
  #
  # @param last_four_digits [String] the last four digits of the card number
  # @return [String] the masked card number as a string.
  def credit_card_number(last_four_digits)
    ((('#' * 4) + '-') * 3) + last_four_digits
  end

  # Formats a date as dd/mm/yyyy.
  #
  # @param date [Date] the date to format.
  # @return [String] the formatted date.
  def format_date(date)
    date.strftime '%d/%m/%Y' if date
  end

  # Formats a datetime as dd/mm/yyyy - H:m.
  #
  # @param date [DateTime] the datetime to format.
  # @return [String] the formatted datetime.
  def format_datetime(dt)
    (dt.strftime '%d/%m/%Y &mdash; %H:%m').html_safe if dt
  end

  # Formats an expiry date (dd/yy) for a credit card payment.
  #
  # @param date [Date] the date to format.
  # @return [String] the formatted date.
  def format_expiry(date)
    date.strftime '%m/%y' if date
  end

  # Gets any current user, or nil if they aren't logged in.
  #
  # @return [User] the current user.
  def current_user
    current_student or current_staff
  end

  # Gets if any user is signed in.
  #
  # @return [Boolean] true if the user is signed in.
  def user_signed_in?
    student_signed_in? or staff_signed_in?
  end

  # Adds the little markdown guide ? thing next to text fields
  #
  # @return [String] HTML for the little markdown guide thing.
  def markdown_support_text
    content_tag(:div, class: 'pull-right text-darkish small', style: 'margin-top: 5px;') do
      concat(icon('arrow-circle-down'))
      concat(' Markdown ')
      concat(link_to '(?)', 'https://daringfireball.net/projects/markdown/basics', class: 'help-cursor', title: 'Markdown Guide')
    end
  end

  # Generates an address from a resource.
  #
  # @param separator [String] the line separator.
  # @return the address as a string.
  def address(resource, separator='<br>')
    [resource.address_1, (resource.address_2 if resource.address_2.present?), resource.city, resource.postcode, resource.country].compact.join(separator).html_safe
  end

  # Displays a tab for the tab view.
  #
  # @param tab [Symbol] the tab to display
  # @param default [Boolean] whether this is the default tab or not (default false)
  # @param tab_name [Symbol] the name for the tab used in the query string.
  # @return [String] the HTML for displaying the tab.
  def tab(tab, default=false, tab_name=:tab)
    tab = tab.to_sym
    selected = params.key?(tab_name) ? params[tab_name].to_sym : (tab if default)
    content_tag(:li, class: ('active' if selected == tab)) do
      link_to(tab.to_s.titleize, request.query_parameters.merge({tab_name => tab}))
    end
  end

  # Returns options for collections with a default option.
  #
  # @param collection [Array] the collection for the options.
  # @param value [Symbol] the value to use from the collection.
  # @param text [Symbol] the text to use from the collection.
  # @param selected [Object] an optional selected element.
  # @return [String] the HTML for the options.
  def options_for_collections_with_default(collection, value, text, selected=nil)
    '<option disabled="disabled" selected="selected">-- Choose --</option>'.html_safe + options_from_collection_for_select(collection, value, text, selected)
  end

  # Returns options for collections with a default option.
  #
  # @param container [String] the container for the options.
  # @param selected [String] an optional selected element.
  # @param [String] the HTML for the options.
  def options_for_select_with_default(container, selected=nil)
    puts "S #{selected}"
    '<option disabled="disabled" selected="selected">-- Choose --</option>'.html_safe + options_for_select(container, selected)
  end
end
