class AddIndexesToJobs < ActiveRecord::Migration[5.0]
  def change
    add_index :jobs, :application_id
  end
end
