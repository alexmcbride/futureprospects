class AddCompletedSubmitFlagToApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :applications, :completed_submit, :boolean
  end
end
