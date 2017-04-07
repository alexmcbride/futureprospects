class CreateReferences < ActiveRecord::Migration[5.0]
  def change
    create_table :references do |t|
      t.integer :application_id
      t.string :full_name
      t.string :occupation
      t.string :relationship
      t.string :address_1
      t.string :address_2
      t.string :country
      t.string :post_code
      t.string :telephone
      t.string :email

      t.timestamps
    end
  end
end
