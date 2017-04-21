class AddFirstIndexesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_index :users, :username
    add_index :users, :first_name
    add_index :users, :family_name
    add_index :users, :college_id
  end
end
