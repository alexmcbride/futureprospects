class AddCourseImageToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :course_image, :string
  end
end
