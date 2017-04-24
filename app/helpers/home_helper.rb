module HomeHelper
  def home_stage_item(text, selected)
    if selected
      content_tag(:li, class: 'home-stage-item-active') do
        concat(text)
        concat(icon('arrow-right', style: 'margin-left: 5px;'))
      end
    else
      content_tag(:li, class: 'home-stage-item') do
        concat(text)
      end
    end
  end
end