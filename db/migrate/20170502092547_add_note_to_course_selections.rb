class AddNoteToCourseSelections < ActiveRecord::Migration[5.0]
  def change
    add_column :course_selections, :note, :string
  end
end
