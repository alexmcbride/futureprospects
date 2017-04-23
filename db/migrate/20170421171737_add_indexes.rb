class AddIndexes < ActiveRecord::Migration[5.0]
  def change
    add_index :users, :username
    add_index :users, :first_name
    add_index :users, :family_name
    add_index :users, :college_id

    add_index :applications, :student_id
    add_index :applications, :created_at

    add_index :courses, :category_id
    add_index :courses, :college_id

    add_index :jobs, :application_id

    add_index :qualifications, :school_id

    add_index :references, :application_id

    add_index :schools, :application_id

    add_index :users_roles, :user_id
    add_index :users_roles, :role_id

    add_index :course_selections, :course_id
    add_index :course_selections, :application_id
  end
end
