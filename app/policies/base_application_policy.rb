# Abstract class all policies inherit from. Policies are used to control which users have access certain models.
class BaseApplicationPolicy
  attr_reader :user, :record

  # Constructor
  #
  # * +user+ - the user to check for access rights
  # * +record+ - the model resource to check
  def initialize(user, record)
    @user = user
    @record = record
  end

  # Default index? access rights.
  #
  # Returns - false
  def index?
    false
  end

  # Default show? access rights.
  #
  # Returns - if the record exists in the scope.
  def show?
    scope.where(:id => record.id).exists?
  end

  # Default create? access rights.
  #
  # Returns - false
  def create?
    false
  end

  # Default new? access rights.
  #
  # Returns - false
  def new?
    create?
  end

  # Default update? access rights.
  #
  # Returns - false
  def update?
    false
  end

  # Default edit? access rights.
  #
  # Returns - false
  def edit?
    update?
  end

  # Default destroy? access rights.
  #
  # Returns - false
  def destroy?
    false
  end

  # Default scope access rights.
  #
  # Returns - the default policy
  def scope
    Pundit.policy_scope!(user, record.class)
  end

  # Class to represent policy scope.
  class Scope
    attr_reader :user, :scope

    # Constructor.
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    # Resolve the permissions for the scope.
    #
    # Returns - all scope.
    def resolve
      scope
    end
  end
end
