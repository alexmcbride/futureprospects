class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer :application_id
      t.integer :type
      t.integer :amount
      t.integer :status
      t.string :last_four_digits

      t.timestamps

      t.index :application_id
    end
  end
end
