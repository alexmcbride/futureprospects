class AddCurrentSelectionsCountToCourses < ActiveRecord::Migration[5.0]
  def up
    add_column :courses, :current_selections_count, :integer, null: false, default: 0

    Course.all.each do |course|
      course.current_selections_count = course.course_selections.current.count
      course.save!
    end
  end

  def down
    remove_column :courses, :current_selections_count
  end
end
