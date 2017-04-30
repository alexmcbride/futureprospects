class AddDescriptionToPayments < ActiveRecord::Migration[5.0]
  include ActionView::Helpers::TextHelper

  def up
    add_column :payments, :description, :string

    Payment.all.each do |payment|
      courses = payment.application.course_selections_count
      payment.description = "Application fee (#{pluralize courses, 'course'})"
      payment.save! validate: false
    end
  end

  def down
    remove_column :payments, :description
  end
end
