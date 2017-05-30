# * Name: Alex McBride
# * Date: 30/05/2017
# * Project: Future Prospects
# Class to manage staff application policy.
class ApplicationPolicy < BaseApplicationPolicy
  # Class to represent resource scope.
  class Scope < Scope
    attr_reader :user, :scope

    # Constructor
    #
    # @param user [User] the user to check for access rights
    # @param scope [ActiveRecord::Relation] the scope to check
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    # Resolves the scope for the policy
    #
    # @return [ActiveRecord::Relation]
    def resolve
      if user.has_role? :site_admin
        scope.all
      elsif user.has_role? :can_view_applications
        # Get list of apps that have at least one course selection for staff member's college.
        scope.college user.college_id
      else
        scope.none
      end
    end
  end

  # Determines if the user is authorized to view the action.
  #
  # @return [Boolean]
  def show?
    user.has_role?(:site_admin) || (user.has_role?(:can_view_applications) && record.belongs_to_college(user.college_id))
  end

  # Determines if the user is authorized to view the action.
  #
  # @return [Boolean]
  def full?
    show?
  end

  # Determines if the user is authorized to view the action.
  #
  # @return [Boolean]
  def edit?
    user.has_role?(:site_admin) || (user.has_role?(:can_edit_applications) && record.belongs_to_college(user.college_id))
  end

  # Determines if the user is authorized to view the action.
  #
  # @return [Boolean]
  def update?
    record.awaiting_decisions? && edit?
  end
end