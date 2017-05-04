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

crumb :application_qualifications do |school|
  parent :application_education, school.application
  link 'Qualifications', applications_qualifications_path(school)
end

crumb :application_education_edit do |school|
  parent :application_education, school.application
  link 'Edit', applications_education_edit_path(school)
end

crumb :application_employment do |application|
  parent :application, application
  link 'Employment', applications_employment_path(application)
end

crumb :application_employment_edit do |school|
  parent :application_employment, school.application
  link 'Edit', applications_employment_edit_path(school)
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

crumb :payments do
  parent :root
  link 'Payments', payment_method_path
end

crumb :payments_new do
  parent :payments
  link 'Enter Details', new_payment_path
end

crumb :payment_authorized do |payment|
  parent :root
  link 'Payment Authorized', payment_path(payment)
end

crumb :decisions do |application|
  parent :root
  link 'Decisions', decisions_path(application)
end

crumb :decisions_firm do |application|
  parent :decisions, application
  link 'Firm Choice', decisions_firm_path(application)
end

crumb :decisions_insurance do |application|
  parent :decisions, application
  link 'Insurance Choice', decisions_insurance_path(application)
end

crumb :decisions_review do |application|
  parent :decisions, application
  link 'Review Choices', decisions_review_path(application)
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

crumb :staff_members do
  parent :root
  link 'Staff', staff_members_path
end

crumb :staff_members_new do
  parent :staff_members
  link 'New', new_staff_member_path
end

crumb :staff_members_show do |user|
  parent :staff_members
  link user.full_name, staff_member_path(user)
end

crumb :staff_members_edit do |user|
  parent :staff_members_show, user
  link 'Show', staff_member_path(user)
end

crumb :staff_members_remove do |user|
  parent :staff_members_show, user
  link 'Remove', staff_member_remove_path(user)
end

crumb :staff_member_permissions do |user|
  parent :staff_members_show, user
  link 'Permissions', staff_member_permissions_path(user)
end

crumb :staff_applications do
  parent :root
  link 'Applications', staff_applications_path
end

crumb :staff_applications_show do |application|
  parent :staff_applications
  link application.student.full_name, staff_application_path(application)
end

crumb :staff_applications_edit do |application|
  parent :staff_applications_show, application
  link 'Decisions', edit_staff_application_path(application)
end