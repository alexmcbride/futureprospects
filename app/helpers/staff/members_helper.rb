# Module to define HTML helpers for the staff members section.
module Staff::MembersHelper
  # Helper to add permissions checkbox.
  #
  # * +member+ - the member the checkbox is for
  # * +role+ - the role the checkbox is for
  # * +name+ - the name of checkbox
  #
  # Returns  - HTML
  def permission_checkbox(member, role, name)
    roles = member.roles.map {|r| r.name}
    content_tag(:div, class: 'form-group', style: 'margin-right: 15px;') do
      concat(check_box_tag "permission[#{role}]", role, roles.include?(role.to_s))
      concat(content_tag(:div, class: 'btn-group') do
        concat(label_tag("permission[#{role}]", class: 'btn btn-success btn-sm') do
          concat(content_tag(:span) do
            concat(icon('check'))
          end)
          concat(content_tag(:span, ' '))
        end)
        concat(label_tag("permission[#{role}]", class: 'btn btn-default btn-sm active', style: 'width: 7vw') do
          name
        end)
      end)
    end
  end
end
