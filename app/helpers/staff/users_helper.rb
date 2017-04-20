module Staff::UsersHelper
  def permission_checkbox(member, role, name)
    content_tag(:div, class: 'form-group') do
      concat(check_box_tag "permission[#{role}]", role, checked: member.has_role?(role), autocomplete: 'off')
      concat(content_tag(:div, class: 'btn-group') do
        concat(label_tag("permission[#{role}]", class: 'btn btn-success') do
          concat(content_tag(:span) do
            concat(icon('check'))
          end)
          concat(content_tag(:span, ' '))
        end)
        concat(label_tag("permission[#{role}]", class: 'btn btn-default active', style: 'width: 8vw') do
          name
        end)
      end)
    end
  end
end
