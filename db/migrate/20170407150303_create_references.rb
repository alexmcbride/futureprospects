class CreateReferences < ActiveRecord::Migration[5.0]
  def change
    create_table :references do |t|
      t.integer :application_id

      t.string :reference_1_full_name
      t.string :reference_1_occupation
      t.string :reference_1_relationship
      t.string :reference_1_address_1
      t.string :reference_1_address_2
      t.string :reference_1_country
      t.string :reference_1_postcode
      t.string :reference_1_telephone
      t.string :reference_1_email

      t.string :reference_2_full_name
      t.string :reference_2_occupation
      t.string :reference_2_relationship
      t.string :reference_2_address_1
      t.string :reference_2_address_2
      t.string :reference_2_country
      t.string :reference_2_postcode
      t.string :reference_2_telephone
      t.string :reference_2_email

      t.timestamps
    end
  end
end
