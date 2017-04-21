class AddIndexesToUsersRoles < ActiveRecord::Migration[5.0]
  def change
    add_index :users_roles, :user_id
    add_index :users_roles, :role_id
  end
end
