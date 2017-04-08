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

crumb :sign_in do
  parent :root
  link 'Sign In', new_student_session_path
end

crumb :profile do
  parent :root
  link 'Profile', edit_student_registration_path
end

crumb :forgot_password do
  parent :root
  link 'Recover Password', new_student_password_path
end

crumb :change_password do
  parent :root
  link 'Change Password', edit_student_password_path
end

crumb :resend_unlock do
  parent :root
  link 'Resend Unlock Instructions', new_student_unlock_path
end

crumb :resend_confirmation do
  parent :root
  link 'Resend Confirmation Instructions', new_student_confirmation_path
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