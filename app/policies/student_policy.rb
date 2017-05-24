class StudentPolicy < BaseApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, other_user)
      @user  = user
      @scope = other_user
    end

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

  def show?
    user.has_role? :site_admin or user.has_role? :can_view_students
  end

  def edit?
    user.has_role? :site_admin or  user.has_role? :can_edit_students
  end

  def update?
    edit?
  end

  def remove?
    user.has_role? :site_admin or user.has_role? :can_remove_students
  end

  def destroy?
    remove?
  end

  def search?
    show?
  end

end
