class CollegePolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

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

  def allow?
    user.has_role? :site_admin or user.has_role?(:can_view_colleges)
  end

  def show?
    user.has_role? :site_admin or (user.college_id == record.id and user.has_role?(:can_view_colleges))
  end

  def new?
    user.has_role? :site_admin or user.has_role?(:can_add_colleges)
  end

  def edit?
    user.has_role? :site_admin or (user.college_id == record.id and user.has_role?(:can_edit_colleges))
  end

  def remove?
    user.has_role? :site_admin or (user.college_id == record.id and user.has_role?(:can_remove_colleges))
  end
end
