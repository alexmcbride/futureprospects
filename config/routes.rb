# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  devise_for :staff, :skip => [:registrations] # Skip staff sign-up
  devise_scope :staff do
    # We skip registrations to stop staff sign up, but we still need to enable staff profile editing
    get 'staff/edit', to: 'devise/registrations#edit', as: 'edit_staff_registration'
    put 'staff', to: 'devise/registrations#update', as: 'staff_registration'
  end
  devise_for :students

  namespace :staff do
    get 'courses/:id/remove', to: 'courses#remove', as: 'course_remove'
    resources :courses
    get 'categories/:id/remove', to: 'categories#remove', as: 'category_remove'
    resources :categories
    get 'colleges/:id/remove', to: 'colleges#remove', as: 'college_remove'
    resources :colleges
    get 'users/:id/permissions', to: 'users#permissions', as: 'user_permissions'
    post 'users/:id/permissions', to: 'users#permissions_update', as: 'user_permissions_update'
    post 'users/:id/promote_admin', to: 'users#promote_admin', as: 'user_promote_admin'
    post 'users/:id/demote_admin', to: 'users#demote_admin', as: 'user_demote_admin'
    get 'users/:id/remove', to: 'users#remove', as: 'user_remove'
    resources :users
  end

  # Application routes
  get 'applications/:id', to: 'new_applications#index', as: 'applications_index'
  post 'applications', to: 'new_applications#create', as: 'applications_create'
  get 'applications/:id/continue', to: 'new_applications#continue', as: 'applications_continue'

  get 'applications/:id/profile', to: 'new_applications#profile', as: 'applications_profile'
  post 'applications/:id/profile', to: 'new_applications#profile_next', as: 'applications_profile_next'

  get 'applications/:id/education', to: 'new_applications#education', as: 'applications_education'
  post 'applications/:id/education', to: 'new_applications#education_add', as: 'applications_education_add'
  delete 'applications/:id/education', to: 'new_applications#education_remove', as: 'applications_education_remove'
  post 'applications/:id/education/next', to: 'new_applications#education_next', as: 'applications_education_next'

  get 'applications/qualifications/:id', to: 'new_applications#qualifications', as: 'applications_qualifications'
  post 'applications/qualifications/:id', to: 'new_applications#qualifications_add', as: 'applications_qualifications_add'
  delete 'applications/qualifications/:id', to: 'new_applications#qualifications_remove', as: 'applications_qualifications_remove'

  get 'applications/:id/employment', to: 'new_applications#employment', as: 'applications_employment'
  post 'applications/:id/employment', to: 'new_applications#employment_add', as: 'applications_employment_add'
  delete 'applications/:id/employment', to: 'new_applications#employment_remove', as: 'applications_employment_remove'
  post 'applications/:id/employment/next', to: 'new_applications#employment_next', as: 'applications_employment_next'

  get 'applications/:id/references', to: 'new_applications#references', as: 'applications_references'
  post 'applications/:id/references', to: 'new_applications#references_next', as: 'applications_references_next'

  get 'applications/:id/statement', to: 'new_applications#statement', as: 'applications_statement'
  post 'applications/:id/statement', to: 'new_applications#statement_next', as: 'applications_statement_next'

  get 'applications/:id/courses', to: 'new_applications#courses', as: 'applications_courses'
  post 'applications/:id/courses', to: 'new_applications#courses_add', as: 'applications_courses_add'
  delete 'applications/:id/courses', to: 'new_applications#courses_remove', as: 'applications_courses_remove'
  post 'applications/:id/courses/next', to: 'new_applications#courses_next', as: 'applications_courses_next'

  get 'applications/:id/submit', to: 'new_applications#submit', as: 'applications_submit'
  post 'applications/:id/submit', to: 'new_applications#submit_next', as: 'applications_submit_next'

  get 'courses/search', to: 'courses#search', as: 'courses_search'

  # Courses
  resources :courses
  get 'courses/category/:id', to: 'courses#category', as: 'courses_category'

  # Colleges
  resources :colleges

  # Root
  get 'home/index'
  root to: 'home#index'
end
