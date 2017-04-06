class CreateSchools < ActiveRecord::Migration[5.0]
  def change
    create_table :schools do |t|
      t.integer :application_id
      t.string :name
      t.string :address_1
      t.string :address_2
      t.string :postcode
      t.string :country

      t.timestamps
    end
  end
end
