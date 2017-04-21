class AddIndexesToCourseSelections < ActiveRecord::Migration[5.0]
  def change
    add_index :course_selections, :course_id
    add_index :course_selections, :application_id
  end
end
