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

  def initialize(user, course)
    super(user, course)
  end

  def show?
    user.college == record.college && user.has_role?(:can_view_courses)
  end

  def new?
    # No college as not added yet.
    has_role_or_admin? :can_add_courses
  end

  def create?
    belongs_to_college && new?
  end

  def edit?
    belongs_to_college_and_role :can_edit_courses
  end

  def update?
    edit?
  end

  def remove?
    belongs_to_college_and_role :can_remove_courses
  end

  def destroy?
    remove?
  end

  private
    def belongs_to_college_and_role(role)
      (belongs_to_college && @user.has_role?(role)) or @user.has_role?(:site_admin)
    end

    def has_role_or_admin?(role)
      @user.has_role(role) or @user.has_role?(:admin)
    end

    def belongs_to_college
      @user.college_id == @record.college_id
    end
end
