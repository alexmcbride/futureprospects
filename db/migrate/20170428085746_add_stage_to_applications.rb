class AddStageToApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :applications, :current_stage, :integer
  end
end
