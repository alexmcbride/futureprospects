class AddRepliesDueToApplications < ActiveRecord::Migration[5.0]
  def up
    add_column :applications, :replies_due, :date

    Application.all.each do |application|
      if application.submitted_date.present?
        application.replies_due = application.submitted_date + rand(2..4).weeks
        application.save
      end
    end
  end

  def down
    remove_column :applications, :replies_due
  end
end
