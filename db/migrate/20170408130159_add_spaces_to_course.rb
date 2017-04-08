class AddSpacesToCourse < ActiveRecord::Migration[5.0]
  def up
    add_column :courses, :spaces, :integer

    # Give each course random spaces between 30 and 90.
    Course.all.each do |c|
      c.spaces = [30, 60, 90].sample
      c.save
    end
  end

  def down
    remove_column :courses, :spaces
  end
end
