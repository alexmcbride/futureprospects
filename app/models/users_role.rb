# Model class to represent User / Role intersection table.
class UsersRole < ApplicationRecord
  belongs_to :user
  belongs_to :role
end