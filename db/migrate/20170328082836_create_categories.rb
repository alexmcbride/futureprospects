class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.index :name #Index for search

      t.timestamps
    end
  end
end
