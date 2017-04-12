class AddStatusToCourses < ActiveRecord::Migration[5.0]
  def up
    add_column :courses, :status, :integer

    Course.all.each do |course|
      course.status = :open
      course.save!
    end
  end

  def down
    remove_column :courses, :status
  end
end
