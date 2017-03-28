class CreateColleges < ActiveRecord::Migration[5.0]
  def change
    create_table :colleges do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :postcode
      t.string :telephone

      t.timestamps
    end
  end
end
