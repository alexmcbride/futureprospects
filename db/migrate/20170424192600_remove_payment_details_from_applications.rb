class RemovePaymentDetailsFromApplications < ActiveRecord::Migration[5.0]
  def change
    remove_column :applications, :payment_amount
    remove_column :applications, :payment_type
    remove_column :applications, :payment_date
  end
end
