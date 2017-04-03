class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.integer :student_id
      t.string :title
      t.string :first_name
      t.string :middle_name
      t.string :family_name
      t.string :previous_name
      t.integer :gender
      t.string :telephone
      t.string :mobile
      t.string :email
      t.string :disability
      t.text :personal_statement
      t.string :permanent_house_number
      t.string :permanent_address_1
      t.string :permanent_address_2
      t.string :permanent_postcode
      t.string :permanent_country
      t.string :correspondence_house_number
      t.string :correspondence_address_1
      t.string :correspondence_address_2
      t.string :correspondence_postcode
      t.string :correspondence_country
      t.integer :state
      t.datetime :submitted_date
      t.decimal :payment_amount, :precision => 4, :scale => 2
      t.integer :payment_type
      t.datetime :payment_date

      t.timestamps
    end
  end
end
