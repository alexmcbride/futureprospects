# * Name: Alex McBride
# * Date: 30/05/2017
# * Project: Future Prospects
# Class to represent which users can assess category models. Used for staff permissions.
class CategoryPolicy < BaseApplicationPolicy
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
    # @param scope [ActiveRecord::Relation] the scope to check
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
  # @return [Boolean]
  def show?
    user.has_role? :site_admin or user.has_role? :can_view_categories
  end

  # Checks if the user can perform this action on the model.
  #
  # @return [Boolean]
  def new?
    user.has_role? :site_admin or user.has_role? :can_add_category
  end

  # Checks if the user can perform this action on the model.
  #
  # @return [Boolean]
  def create?
    new?
  end

  # Checks if the user can perform this action on the model.
  #
  # @return [Boolean]
  def edit?
    user.has_role? :site_admin or user.has_role? :can_edit_category
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
    user.has_role? :site_admin or user.has_role? :can_remove_category
  end

  # Checks if the user can perform this action on the model.
  #
  # @return [Boolean]
  def destroy?
    remove?
  end
end
