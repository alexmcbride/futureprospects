# * Name: Alex McBride
# * Date: 30/05/2017
# * Project: Future Prospects
# Class to represent which users can assess college models. Used for staff permissions.
class CollegePolicy < BaseApplicationPolicy
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
      elsif user.has_role? :can_view_colleges
        scope.where(id: user.college_id)
      else
        scope.none
      end
    end
  end

  # Checks if the user can perform this action on the model.
  #
  # @return [Boolean]
  def show?
    user.has_role? :site_admin or (user.college_id == record.id and user.has_role?(:can_view_colleges))
  end

  # Checks if the user can perform this action on the model.
  #
  # @return [Boolean]
  def new?
    user.has_role? :site_admin or user.has_role?(:can_add_colleges)
  end

  # Checks if the user can perform this action on the model.
  #
  # @return [Boolean]
  def create?
    user.has_role? :site_admin or (user.college_id == record.id and user.has_role?(:can_add_colleges))
  end

  # Checks if the user can perform this action on the model.
  #
  # @return [Boolean]
  def edit?
    user.has_role? :site_admin or (user.college_id == record.id and user.has_role?(:can_edit_colleges))
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
    user.has_role? :site_admin
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
  def clearance?
    user.has_role? :site_admin or (user.college_id == record.id and user.has_role?(:can_manage_clearance))
  end

  # Checks if the user can perform this action on the model.
  #
  # @return [Boolean]
  def clearance_update?
    edit?
  end

  # Checks if the user can perform this action on the model.
  #
  # @return [Boolean]
  def show_college?
    show?
  end
end
