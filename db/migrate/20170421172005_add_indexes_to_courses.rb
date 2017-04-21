class AddIndexesToCourses < ActiveRecord::Migration[5.0]
  def change
    add_index :courses, :category_id
    add_index :courses, :college_id
  end
end
