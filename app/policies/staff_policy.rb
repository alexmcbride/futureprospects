# * Name: Alex McBride
# * Date: 30/05/2017
# * Project: Future Prospects
# Class to represent which users can assess course models. Used for staff permissions.
class StaffPolicy < BaseApplicationPolicy
  # Class to represent resource scope.
  class Scope < Scope
    attr_reader :user, :scope

    # Constructor
    #
    # @param user [User] the user to check for access rights
    # @param scope [ActiveRecord::Relation] the scope to check
    def initialize(user, other_user)
      @user  = user
      @scope = other_user
    end

    # Resolves the scope for the policy
    #
    # @return [ActiveRecord::Relation]
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

  # Checks if the user can perform this action on the model.
  #
  # @return [Boolean]
  def show?
    user.has_role? :site_admin or (user.college_id == record.college_id and user.has_role? :can_view_staff)
  end

  # Checks if the user can perform this action on the model.
  #
  # @return [Boolean]
  def new?
    user.has_role? :site_admin or user.has_role? :can_add_staff
  end

  # Checks if the user can perform this action on the model.
  #
  # @return [Boolean]
  def create?
    user.has_role? :site_admin or (user.college_id == record.college_id and user.has_role? :can_add_staff)
  end

  # Checks if the user can perform this action on the model.
  #
  # @return [Boolean]
  def edit?
    if user.id == record.id or record.has_role? :site_admin
      return false
    end
    user.has_role? :site_admin or (user.college_id == record.college_id and user.has_role? :can_edit_staff)
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
    if user.id == record.id or record.has_role? :site_admin
      return false
    end
    user.has_role? :site_admin or (user.college_id == record.college_id and user.has_role? :can_remove_staff)
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
  def permissions?
    # Can't change your own permissions
    if user.id == record.id
      return false
    end

    # Admin can edit any role (except their own)
    if user.has_role? :site_admin
      return true
    end

    # Only admin can edit admin.
    if record.has_role? :site_admin
      return false
    end

    # Everyone else
    user.college_id == record.college_id and user.has_role? :can_promote_staff
  end

  # Checks if the user can perform this action on the model.
  #
  # @return [Boolean]
  def permissions_update?
    permissions?
  end

  # Checks if the user can perform this action on the model.
  #
  # @return [Boolean]
  def promote_admin?
    user.id != record.id && user.has_role?(:site_admin)
  end

  # Checks if the user can perform this action on the model.
  #
  # @return [Boolean]
  def demote_admin?
    promote_admin?
  end
end
