class AddCardHolderToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :card_holder, :string
  end
end
