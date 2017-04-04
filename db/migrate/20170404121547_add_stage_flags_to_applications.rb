class AddStageFlagsToApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :applications, :completed_intro, :boolean
    add_column :applications, :completed_profile, :boolean
    add_column :applications, :completed_education, :boolean
    add_column :applications, :completed_employment, :boolean
    add_column :applications, :completed_references, :boolean
    add_column :applications, :completed_statement, :boolean
    add_column :applications, :completed_courses, :boolean
  end
end
