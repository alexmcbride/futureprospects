# * Name: Alex McBride
# * Date: 30/05/2017
# * Project: Future Prospects
# Abstract class all policies inherit from. Policies are used to control which users have access to which models.
class BaseApplicationPolicy
  attr_reader :user, :record

  # Constructor
  #
  # @param user [User] the user to check for access rights
  # @param record [Resource] the scope to check
  def initialize(user, record)
    @user = user
    @record = record
  end

  # Default index? access rights.
  #
  # @return [Boolean]
  def index?
    false
  end

  # Default show? access rights.
  #
  # @return [Boolean]
  def show?
    scope.where(:id => record.id).exists?
  end

  # Default create? access rights.
  #
  # @return [Boolean]
  def create?
    false
  end

  # Default new? access rights.
  #
  # @return [Boolean]
  def new?
    create?
  end

  # Default update? access rights.
  #
  # @return [Boolean]
  def update?
    false
  end

  # Default edit? access rights.
  #
  # @return [Boolean]
  def edit?
    update?
  end

  # Default destroy? access rights.
  #
  # @return [Boolean]
  def destroy?
    false
  end

  # Default scope access rights.
  #
  # @return [ActiveRecord::Relation]
  def scope
    Pundit.policy_scope!(user, record.class)
  end

  # Class to represent policy scope.
  class Scope
    attr_reader :user, :scope

    # Constructor
    #
    # @param user [User] the user to check for access rights
    # @param scope [ActiveRecord::Relation] the scope to check
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    # Resolve the permissions for the scope.
    #
    # @return [ActiveRecord::Relation]
    def resolve
      scope
    end
  end
end
