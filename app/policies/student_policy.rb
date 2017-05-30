# * Name: Alex McBride
# * Date: 30/05/2017
# * Project: Future Prospects
# Class to manage student access policy.
class StudentPolicy < BaseApplicationPolicy
  # Class to represent resource scope.
  class Scope < Scope
    attr_reader :user, :scope

    # Constructor
    #
    # @param user [User] the user to check for access rights
    # @param scope [ActiveRecord::Relation] the scope to check
    def initialize(user, other_user)
      @user  = user
      @scope = other_user
    end

    # Resolves the scope for the policy
    #
    # @return [ActiveRecord::Relation]
    def resolve
      if user.has_role? :site_admin
        scope.all
      elsif user.has_role? :can_view_students
        scope.all
      else
        scope.none
      end
    end
  end

  # Determines if the user is authorized to view the action.
  #
  # @return [Boolean]
  def show?
    user.has_role? :site_admin or user.has_role? :can_view_students
  end

  # Determines if the user is authorized to view the action.
  #
  # @return [Boolean]
  def edit?
    user.has_role? :site_admin or  user.has_role? :can_edit_students
  end

  # Determines if the user is authorized to view the action.
  #
  # @return [Boolean]
  def update?
    edit?
  end

  # Determines if the user is authorized to view the action.
  #
  # @return [Boolean]
  def remove?
    user.has_role? :site_admin or user.has_role? :can_remove_students
  end

  # Determines if the user is authorized to view the action.
  #
  # @return [Boolean]
  def destroy?
    remove?
  end

  # Determines if the user is authorized to view the action.
  #
  # @return [Boolean]
  def search?
    show?
  end
end
