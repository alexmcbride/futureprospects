Rails.application.routes.draw do
  get 'applications/:id', to: 'applications#index', as: 'applications_index'
  post 'applications', to: 'applications#create', as: 'applications_create'
  get 'applications/:id/continue', to: 'applications#continue', as: 'applications_continue'

  get 'applications/:id/profile', to: 'applications#profile', as: 'applications_profile'
  post 'applications/:id/profile', to: 'applications#profile_next', as: 'applications_profile_next'

  get 'applications/:id/education', to: 'applications#education', as: 'applications_education'
  post 'applications/:id/education', to: 'applications#education_add', as: 'applications_education_add'
  delete 'applications/:id/education', to: 'applications#education_remove', as: 'applications_education_remove'
  post 'applications/:id/education/next', to: 'applications#education_next', as: 'applications_education_next'

  get 'applications/qualifications/:id', to: 'applications#qualifications', as: 'applications_qualifications'
  post 'applications/qualifications/:id', to: 'applications#qualifications_add', as: 'applications_qualifications_add'
  delete 'applications/qualifications/:id', to: 'applications#qualifications_remove', as: 'applications_qualifications_remove'

  get 'applications/:id/employment', to: 'applications#employment', as: 'applications_employment'
  post 'applications/:id/employment', to: 'applications#employment_add', as: 'applications_employment_add'
  delete 'applications/:id/employment', to: 'applications#employment_remove', as: 'applications_employment_remove'
  post 'applications/:id/employment/next', to: 'applications#employment_next', as: 'applications_employment_next'

  get 'applications/:id/references', to: 'applications#references', as: 'applications_references'
  post 'applications/:id/references', to: 'applications#references_next', as: 'applications_references_next'

  get 'applications/:id/statement', to: 'applications#statement', as: 'applications_statement'
  post 'applications/:id/statement', to: 'applications#statement_next', as: 'applications_statement_next'

  get 'applications/:id/courses', to: 'applications#courses', as: 'applications_courses'
  post 'applications/:id/courses', to: 'applications#courses_add', as: 'applications_courses_add'
  delete 'applications/:id/courses', to: 'applications#courses_remove', as: 'applications_courses_remove'
  post 'applications/:id/courses/next', to: 'applications#courses_next', as: 'applications_courses_next'

  get 'applications/:id/submit', to: 'applications#submit', as: 'applications_submit'
  post 'applications/:id/submit', to: 'applications#submit_next', as: 'applications_submit_next'

  get 'courses/search', to: 'courses#search', as: 'courses_search'

  devise_for :students
  resources :courses
  resources :colleges

  get 'home/index'
  get 'courses/category/:id', to: 'courses#category', as: 'courses_category'

  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
