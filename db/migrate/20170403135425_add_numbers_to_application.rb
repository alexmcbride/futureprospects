class AddNumbersToApplication < ActiveRecord::Migration[5.0]
  def change
    add_column :applications, :scottish_candidate_number, :string
    add_column :applications, :national_insurance_number, :string
  end
end
