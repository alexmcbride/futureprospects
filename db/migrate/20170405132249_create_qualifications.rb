class CreateQualifications < ActiveRecord::Migration[5.0]
  def change
    create_table :qualifications do |t|
      t.integer :school_id
      t.string :subject
      t.string :award
      t.string :grade
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
