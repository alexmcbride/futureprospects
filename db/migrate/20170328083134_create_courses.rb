class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.text :entry_requirements
      t.text :career_prospects
      t.datetime :start_date
      t.datetime :end_date
      t.string :level

      t.timestamps
    end
  end
end
