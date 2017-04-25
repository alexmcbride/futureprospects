class RenamedTypeToPaymentTypeForPayments < ActiveRecord::Migration[5.0]
  def change
    rename_column :payments, :type, :payment_type
  end
end
