# Class to manage staff application policy.
class ApplicationPolicy < BaseApplicationPolicy
  # Class to represent lists of categories.
  class Scope < Scope
    attr_reader :user, :scope

    # Constructor
    #
    # * +user+ - the user to check for access rights
    # * +scope+ - the scope to check
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    # Resolves the scope for the policy
    #
    # Returns - the scope this user can access.
    def resolve
      if user.has_role? :site_admin
        scope.all
      else
        # Get list of apps that have at least one course selection for staff member's college.
        scope.college_applications user.college_id
      end
    end
  end

  # Determines if the user is authorized to view the show action.
  def show?
    user.has_role?(:site_admin) || record.belongs_to_college(user.college_id)
  end
end