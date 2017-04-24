class RenameApplicationsStateToStatus < ActiveRecord::Migration[5.0]
  def change
    rename_column :applications, :state, :status
  end
end
