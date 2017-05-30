# * Name: Alex McBride
# * Date: 30/05/2017
# * Project: Future Prospects
# Class to manage course selection policy.
class CourseSelectionPolicy < BaseApplicationPolicy
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
      else
        scope.joins(:course).where('courses.college_id=?', user.college_id)
      end
    end
  end
end