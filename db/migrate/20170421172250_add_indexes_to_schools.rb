class AddIndexesToSchools < ActiveRecord::Migration[5.0]
  def change
    add_index :schools, :application_id
  end
end
