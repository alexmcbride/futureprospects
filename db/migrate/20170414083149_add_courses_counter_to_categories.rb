class AddCoursesCounterToCategories < ActiveRecord::Migration[5.0]
  def up
    add_column :categories, :courses_counter, :integer

    Category.all.each do |category|
      category.courses_counter = category.courses.count
      category.save!
    end
  end

  def down
    remove_column :categories, :courses_counter
  end
end
