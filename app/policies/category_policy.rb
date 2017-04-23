# Class to represent which users can assess category models. Used for staff permissions.
class CategoryPolicy < ApplicationPolicy
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
      elsif user.has_role? :can_view_categories
        # Only categories that have a course that belongs to this user's college.
        scope.joins(:courses)
            .select('DISTINCT categories.name, categories.id, categories.courses_count')
            .where('courses.college_id=?', user.college_id)
      else
        scope.none
      end
    end
  end

  # Checks if the user can perform this action on the model.
  #
  # Returns - a boolean indicating if the action is allowed.
  def show?
    user.has_role? :site_admin or user.has_role? :can_view_categories
  end

  # Checks if the user can perform this action on the model.
  #
  # Returns - a boolean indicating if the action is allowed.
  def new?
    user.has_role? :site_admin or user.has_role? :can_add_category
  end

  # Checks if the user can perform this action on the model.
  #
  # Returns - a boolean indicating if the action is allowed.
  def create?
    new?
  end

  # Checks if the user can perform this action on the model.
  #
  # Returns - a boolean indicating if the action is allowed.
  def edit?
    user.has_role? :site_admin or user.has_role? :can_edit_category
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
    user.has_role? :site_admin or user.has_role? :can_remove_category
  end

  # Checks if the user can perform this action on the model.
  #
  # Returns - a boolean indicating if the action is allowed.
  def destroy?
    remove?
  end
end
