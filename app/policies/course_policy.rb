# * Name: Alex McBride
# * Date: 30/05/2017
# * Project: Future Prospects
# Class to represent which users can assess course models. Used for staff permissions.
class CoursePolicy < BaseApplicationPolicy
  # Class to represent resource scope.
  class Scope < Scope
    attr_reader :user, :scope

    # Constructor
    #
    # @param user [User] the user to check for access rights
    # @param scope [ActiveRecord::Relation] the scope to check
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    # Resolves the scope for the policy
    #
    # @return [ActiveRecord::Relation]
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

  # Checks if the user can perform this action on the model.
  #
  # @return [Boolean]
  def show?
    user.has_role? :site_admin or (user.college_id == record.college_id && user.has_role?(:can_view_courses))
  end

  # Checks if the user can perform this action on the model.
  #
  # @return [Boolean]
  def new?
    # No college as not added yet.
    user.has_role? :site_admin or user.has_role?(:can_add_courses)
  end

  # Checks if the user can perform this action on the model.
  #
  # @return [Boolean]
  def create?
    user.has_role? :site_admin or (user.college_id == record.college_id && user.has_role?(:can_add_courses))
  end

  # Checks if the user can perform this action on the model.
  #
  # @return [Boolean]
  def edit?
    user.has_role? :site_admin or (user.college_id == record.college_id && user.has_role?(:can_edit_courses))
  end

  # Checks if the user can perform this action on the model.
  #
  # @return [Boolean]
  def update?
    edit?
  end

  # Checks if the user can perform this action on the model.
  #
  # @return [Boolean]
  def remove?
    user.has_role? :site_admin or (user.college_id == record.college_id && user.has_role?(:can_remove_courses))
  end

  # Checks if the user can perform this action on the model.
  #
  # @return [Boolean]
  def destroy?
    remove?
  end

  # Checks if the user can perform this action on the model.
  #
  # @return [Boolean]
  def show_course?
    show?
  end
end
