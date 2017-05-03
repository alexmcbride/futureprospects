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
    label_tag("permission[#{role}]") do
      concat(check_box_tag "permission[#{role}]", role, roles.include?(role.to_s), style: 'margin-right: 5px;')
      concat(name)
    end
  end
end
