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

  def initialize(user, college)
    super(user, college)
  end

  def show?
     @user.has_role?(:site_admin) || belongs_to_college_and_role(:can_view_colleges)
  end

  def new?
    @user.has_role? :site_admin
  end

  def edit?
    @user.has_role?(:site_admin) || belongs_to_college_and_role(:can_view_colleges)
  end

  def create?
    new?
  end

  def update?
    edit?
  end

  def remove?
    @user.has_role? :site_admin
  end

  def destroy?
    remove?
  end

  private
    def has_role_or_admin?(role)
      @user.has_role?(role) || @user.has_role?(:site_admin)
    end

    def belongs_to_college_and_role(role)
      belongs_to_college or @user.has_role?(role)
    end

    def belongs_to_college
      @user.college_id == @record.id
    end
end
