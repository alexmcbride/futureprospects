class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.index :title # Index for search
      t.text :description
      t.text :entry_requirements
      t.text :career_prospects
      t.date :start_date
      t.date :end_date
      t.string :level

      # Foreign keys
      t.integer :college_id
      t.integer :category_id

      t.timestamps
    end


  end
end
