class CreateColleges < ActiveRecord::Migration[5.0]
  def change
    create_table :colleges do |t|
      t.string :name
      t.index :name # Index for search
      t.text :description
      t.string :address
      t.string :postcode
      t.string :telephone
      t.string :email
      t.string :website

      t.timestamps
    end
  end
end
