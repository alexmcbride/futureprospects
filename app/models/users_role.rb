# * Name: Alex McBride
# * Date: 25/05/2017
# * Project: Future Prospects
# * Model class to represent User / Role intersection table.
class UsersRole < ApplicationRecord
  # @!attribute user
  #   @return [User]
  #   The user the role belongs to.
  belongs_to :user

  # @!attribute role
  #   @return [Role]
  #   The role the user belongs to.
  belongs_to :role
end