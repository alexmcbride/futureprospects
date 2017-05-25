# * Name: Alex McBride
# * Date: 24/05/2017
# * Project: Future Prospects
# Module for home controller helpers. These are functions that can be called in views.
module HomeHelper
  # Creates HTML for home page stage item.
  #
  # @param text [String] the text of the item.
  # @param selected [Boolean] whether the item is selected.
  # @return [String] the HTML to display the item.
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