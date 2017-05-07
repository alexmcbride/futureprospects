module DecisionsHelper
  def decision_stage_item(text, selected, completed=false)
    content_tag(:div, class: "list-group-item#{' active' if selected}") do
      concat(text)
      if selected
        concat(icon('arrow-right', class: 'pull-right', style: 'font-size: 15pt;'))
      end
      if completed
        concat(icon('check', class: 'pull-right', style: 'color: green; font-size: 18pt;'))
      end
    end
  end

  def decision_list_item(selection)
    content_tag(:div, class: 'list-group-item list-group-item-heading', style: 'background-color: #F5F5F5; clear: both;') do
      yield if block_given?
      concat(content_tag(:h4, style: 'margin-top: 6px;') do
        concat(content_tag(:strong, selection.course.title))
        concat('&nbsp;'.html_safe)
        concat(content_tag(:small, selection.course.college.name, style: 'color: #787878;'))
      end)
      concat(content_tag(:p, selection.college_offer.nil? ? 'Decision pending...' : selection.college_offer.humanize))
      concat(selection.note.present? ? content_tag(:p, selection.note) : '&nbsp;'.html_safe)
    end
  end
end