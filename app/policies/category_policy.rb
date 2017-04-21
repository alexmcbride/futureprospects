class CategoryPolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.has_role? :site_admin or user.has_role? :can_view_categories
        scope.all
      else
        scope.none
      end
    end
  end

  def allow?
    show?
  end

  def show?
    user.has_role? :site_admin or user.has_role? :can_view_categories
  end

  def new?
    user.has_role? :site_admin or user.has_role? :can_add_category
  end

  def create?
    new?
  end

  def edit?
    user.has_role? :site_admin or user.has_role? :can_edit_category
  end

  def update?
    edit?
  end

  def remove?
    user.has_role? :site_admin or user.has_role? :can_remove_category
  end

  def destroy?
    remove?
  end
end
