class AddClearanceToColleges < ActiveRecord::Migration[5.0]
  def up
    add_column :colleges, :clearance, :boolean, null: false, default: false
  end

  def down
    remove_column :colleges, :clearance
  end
end
