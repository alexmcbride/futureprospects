class RemoveEmailScnNinFromApplications < ActiveRecord::Migration[5.0]
  def change
    remove_column :applications, :email
    remove_column :applications, :scottish_candidate_number
    remove_column :applications, :national_insurance_number
  end
end
