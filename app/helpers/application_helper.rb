module ApplicationHelper
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

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end

  # Removes the http:// bit from the start of URLs
  def clean_url(url)
    (URI.split url).compact.slice(1, 1).join
  end

  # Gets text for the current application status.
  def app_status_text(app)
    if app.submitted?
      return 'Make Payment'
    end
    if app.active?
      return 'Continue Application'
    end
    'Create Application'
  end
end
