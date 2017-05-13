# Class to represent which users can assess college models. Used for staff permissions.
class CollegePolicy < BaseApplicationPolicy
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
      elsif user.has_role? :can_view_colleges
        scope.where(id: user.college_id)
      else
        scope.none
      end
    end
  end

  # Checks if the user can perform this action on the model.
  #
  # Returns - a boolean indicating if the action is allowed.
  def show?
    user.has_role? :site_admin or (user.college_id == record.id and user.has_role?(:can_view_colleges))
  end

  # Checks if the user can perform this action on the model.
  #
  # Returns - a boolean indicating if the action is allowed.
  def new?
    user.has_role? :site_admin or user.has_role?(:can_add_colleges)
  end

  # Checks if the user can perform this action on the model.
  #
  # Returns - a boolean indicating if the action is allowed.
  def create?
    user.has_role? :site_admin or (user.college_id == record.id and user.has_role?(:can_add_colleges))
  end

  # Checks if the user can perform this action on the model.
  #
  # Returns - a boolean indicating if the action is allowed.
  def edit?
    user.has_role? :site_admin or (user.college_id == record.id and user.has_role?(:can_edit_colleges))
  end

  # Checks if the user can perform this action on the model.
  #
  # Returns - a boolean indicating if the action is allowed.
  def update?
    edit?
  end

  # Checks if the user can perform this action on the model.
  #
  # Returns - a boolean indicating if the action is allowed.
  def remove?
    user.has_role? :site_admin
  end

  # Checks if the user can perform this action on the model.
  #
  # Returns - a boolean indicating if the action is allowed.
  def destroy?
    remove?
  end

  # Checks if the user can perform this action on the model.
  #
  # Returns - a boolean indicating if the action is allowed.
  def clearance?
    edit?
  end

  # Checks if the user can perform this action on the model.
  #
  # Returns - a boolean indicating if the action is allowed.
  def clearance_update?
    edit?
  end
end
