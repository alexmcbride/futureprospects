class AddCourseSelectionsCountToApplications < ActiveRecord::Migration[5.0]
  def up
    add_column :applications, :course_selections_count, :integer

    Application.all.each do |app|
      app.course_selections_count = app.course_selections.count
      app.save!
    end
  end

  def down
    remove_column :applications, :course_selections_count
  end
end
