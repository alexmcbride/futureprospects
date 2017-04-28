class AddCityFieldToAddresses < ActiveRecord::Migration[5.0]
  def up
    add_column :applications, :permanent_city, :string
    add_column :applications, :correspondence_city, :string
    add_column :jobs, :city, :string
    add_column :references, :reference_1_city, :string
    add_column :references, :reference_2_city, :string
    add_column :schools, :city, :string
  end

  def down
    remove_column :schools, :city
    remove_column :jobs, :city
    remove_column :applications, :city
    remove_column :references, :permanent_city
    remove_column :references, :correspondence_city
  end
end

