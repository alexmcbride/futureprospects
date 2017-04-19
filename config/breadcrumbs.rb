# Breadcrumb menus for Gretel gem

# root
crumb :root do
  link 'Home', root_path
end

# courses
crumb :courses do |category|
  parent :root
  link 'Courses', courses_path
  unless category.nil?
    link category.name, courses_category_path(category)
  end
end

# courses/:id
crumb :course do |course|
  parent :root
  parent :courses, course.category
  link course.title, course
end

# colleges
crumb :colleges do
  parent :root
  link 'Colleges', colleges_path
end

# colleges/:id
crumb :college do |college|
  parent :colleges
  link college.name, college_path(college)
end

# students
crumb :register do
  parent :root
  link 'Register', new_student_registration_path
end

crumb :sign_in do
  parent :root
  link 'Sign In', new_student_session_path
end

crumb :sign_in do |resource|
  parent :root
  link 'Sign In', new_session_path(resource)
end

crumb :profile do |resource|
  parent :root
  link 'Profile', edit_registration_path(resource)
end

crumb :forgot_password do |resource|
  parent :sign_in, resource
  link 'Recover Password', new_password_path(resource)
end

crumb :change_password do |resource|
  parent :sign_in, resource
  link 'Change Password', edit_password_path(resource)
end

crumb :resend_unlock do |resource|
  parent :sign_in, resource
  link 'Resend Unlock Instructions', new_unlock_path(resource)
end

crumb :resend_confirmation do|resource|
  parent :register, resource
  link 'Resend Confirmation Instructions', new_confirmation_path(resource)
end

crumb :application do |application|
  parent :root
  link 'Application', applications_index_path(application)
end

crumb :application_profile do |application|
  parent :application, application
  link 'Profile', applications_profile_path(application)
end

crumb :application_education do |application|
  parent :application, application
  link 'Education', applications_education_path(application)
end

crumb :application_qualifications do |institution|
  parent :application_education, institution.application
  link institution.name, applications_qualifications_path(institution)
end

crumb :application_employment do |application|
  parent :application, application
  link 'Employment', applications_employment_path(application)
end

crumb :application_references do |application|
  parent :application, application
  link 'References', applications_references_path(application)
end

crumb :application_statement do |application|
  parent :application, application
  link 'Personal Statement', applications_statement_path(application)
end

crumb :application_courses do |application|
  parent :application, application
  link 'Courses', applications_courses_path(application)
end

crumb :application_submit do |application|
  parent :application, application
  link 'Submit', applications_submit_path(application)
end

crumb :staff_courses do
  parent :root
  link 'Courses', staff_courses_path
end

crumb :staff_show_course do |course|
  parent :staff_courses
  link course.title, staff_course_path(course)
end

crumb :staff_add_course do
  parent :staff_courses
  link 'Add', new_staff_course_path
end

crumb :staff_edit_course do |course|
  parent :staff_show_course, course
  link 'Edit', edit_staff_course_path(course)
end

crumb :staff_remove_course do |course|
  parent :staff_show_course, course
  link 'Remove', staff_course_remove_path(course)
end

crumb :staff_categories do
  parent :staff_courses
  link 'Categories', staff_categories_path
end

crumb :staff_new_category do
  parent :staff_categories
  link 'Add', new_staff_category_path
end

crumb :staff_edit_category do |category|
  parent :staff_categories
  link 'Edit', edit_staff_category_path(category)
end

crumb :staff_remove_category do |category|
  parent :staff_categories
  link 'Remove', staff_category_remove_path(category)
end

crumb :staff_colleges do
  parent :root
  link 'Colleges', staff_colleges_path
end

crumb :staff_show_college do |college|
  parent :staff_colleges
  link college.name, staff_college_path(college)
end

crumb :staff_edit_college do |college|
  parent :staff_show_college, college
  link 'Edit', edit_staff_college_path(college)
end

crumb :staff_remove_college do |college|
  parent :staff_show_college, college
  link 'Delete', staff_college_remove_path(college)
end

crumb :staff_new_college do
  parent :staff_colleges
  link 'New', new_staff_college_path
end

crumb :staff_users do
  parent :root
  link 'Staff', staff_users_path
end

crumb :staff_users_new do
  parent :staff_users
  link 'New', new_staff_user_path
end

crumb :staff_users_show do |user|
  parent :staff_users
  link user.full_name, staff_user_path(user)
end

crumb :staff_users_edit do |user|
  parent :staff_users_show, user
  link 'Show', staff_user_path(user)
end

crumb :staff_users_remove do |user|
  parent :staff_users_show, user
  link 'Remove', staff_user_remove_path(user)
end

crumb :staff_user_permissions do |user|
  parent :staff_users_show, user
  link 'Permissions', staff_user_permissions_path(user)
end
