module ApplicationHelper
  # Helper function for flash_messages.
  def bootstrap_class_for flash_type
    { success: 'alert-success', error: 'alert-danger', warning: 'alert-warning'}[flash_type.to_sym]
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
  
  # Returns the specified text as markdown.
  def markdown(text)
    options = {
        filter_html:     true,
        hard_wrap:       true,
        link_attributes: { rel: 'nofollow', target: "_blank" },
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
end
