class AddCardHolderToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :card_holder, :string

    Payment.all.each do |payment|
      payment.card_holder = payment.application.student.full_name
      payment.save!
    end
  end
end
