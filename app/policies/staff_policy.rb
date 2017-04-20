class StaffPolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, other_user)
      @user  = user
      @scope = other_user
    end

    def resolve
      if user.has_role? :site_admin
        scope.all
      elsif user.has_role? :can_view_staff
        scope.where(college_id: user.college_id)
      else
        scope.none
      end
    end
  end

  def allow?
    user.has_role? :site_admin or user.has_role? :can_view_staff
  end

  def show?
    user.has_role? :site_admin or (user.college_id == record.college_id and user.has_role? :can_view_staff)
  end

  def new?
    user.has_role? :site_admin or user.has_role? :can_add_staff
  end

  def create?
    user.has_role? :site_admin or (user.college_id == record.college_id and user.has_role? :can_add_staff)
  end

  def edit?
    if user.id == record.id or record.has_role? :site_admin
      return false
    end
    user.has_role? :site_admin or (user.college_id == record.college_id and user.has_role? :can_edit_staff)
  end

  def update?
    edit?
  end

  def remove?
    if user.id == record.id or record.has_role? :site_admin
      return false
    end
    user.has_role? :site_admin or (user.college_id == record.college_id and user.has_role? :can_remove_staff)
  end

  def destroy?
    remove?
  end

  def permissions?
    if user.id == record.id or record.has_role? :site_admin
      return false
    end
    user.has_role? :site_admin or (user.college_id == record.college_id and user.has_role? :can_promote_staff)
  end

  def permissions_update?
    permissions?
  end
end
