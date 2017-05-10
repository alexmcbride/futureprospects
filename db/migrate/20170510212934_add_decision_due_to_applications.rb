class AddDecisionDueToApplications < ActiveRecord::Migration[5.0]
  def up
    add_column :applications, :decision_due, :date

    Application.all.each do |application|
      if application.submitted_date.present?
        application.decision_due = application.submitted_date + rand(2..4).weeks
        application.save
      end
    end
  end

  def down
    remove_column :applications, :decision_due
  end
end
