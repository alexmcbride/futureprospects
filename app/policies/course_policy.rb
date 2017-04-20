class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.has_role? :site_admin
        scope.all
      elsif user.has_role? :can_view_courses
        scope.where(college_id: @user.college_id)
      else
        scope.none
      end
    end
  end

  def allow?
    user.has_role? :site_admin or user.has_role?(:can_view_courses)
  end

  def show?
    user.has_role? :site_admin or (user.college_id == record.college_id && user.has_role?(:can_view_courses))
  end

  def new?
    # No college as not added yet.
    user.has_role? :site_admin or user.has_role?(:can_add_courses)
  end

  def edit?
    user.has_role? :site_admin or (user.college_id == record.college_id && user.has_role?(:can_edit_courses))
  end

  def remove?
    user.has_role? :site_admin or (user.college_id == record.college_id && user.has_role?(:can_remove_courses))
  end
end
