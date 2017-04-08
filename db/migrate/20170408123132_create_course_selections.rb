class CreateCourseSelections < ActiveRecord::Migration[5.0]
  def change
    create_table :course_selections do |t|
      t.integer :application_id
      t.integer :course_id
      t.integer :college_offer
      t.integer :student_choice
      t.index [:application_id, :course_id], unique: true # Unique composite constraint

      t.timestamps
    end
  end
end
