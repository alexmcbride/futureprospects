class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.integer :application_id
      t.string :employer
      t.string :address_1
      t.string :address_2
      t.string :postcode
      t.string :country
      t.string :job_title
      t.string :duties
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
