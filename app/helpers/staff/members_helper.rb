# * Name: Alex McBride
# * Date: 24/05/2017
# * Project: Future Prospects
# Module to define HTML helpers for the staff members section.
module Staff::MembersHelper
  # Helper to add permissions checkbox.
  #
  # @param member [Staff] the member the checkbox is for
  # @param role [Role] the role the checkbox is for
  # @param name [String] the name of checkbox
  # @return [String]
  def permission_checkbox(member, role, name)
    roles = member.roles.map {|r| r.name}
    label_tag("permission[#{role}]") do
      concat(check_box_tag "permission[#{role}]", role, roles.include?(role.to_s), style: 'margin-right: 5px;')
      concat(name)
    end
  end
end
