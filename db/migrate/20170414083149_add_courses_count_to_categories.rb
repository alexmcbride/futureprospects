class AddCoursesCountToCategories < ActiveRecord::Migration[5.0]
  def up
    add_column :categories, :courses_count, :integer, :null => false, :default => 0

    Category.all.each do |category|
      count = category.courses.count
      category.courses_count = count
      category.save!
    end
  end

  def down
    remove_column :categories, :courses_count
  end
end
