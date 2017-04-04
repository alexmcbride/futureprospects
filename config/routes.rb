Rails.application.routes.draw do
  get 'applications/:id', to: 'applications#index', as: 'applications_index'
  post 'applications/:id', to: 'applications#index_next', as: 'applications_index_next'
  get 'applications/:id/profile', to: 'applications#profile', as: 'applications_profile'
  post 'applications/:id/profile', to: 'applications#profile_next', as: 'applications_profile_next'
  get 'applications/:id/education', to: 'applications#education', as: 'applications_education'
  post 'applications/:id/education', to: 'applications#education_next', as: 'applications_education_next'
  get 'applications/:id/employment', to: 'applications#employment', as: 'applications_employment'
  post 'applications/:id/employment', to: 'applications#employment_next', as: 'applications_employment_next'
  get 'applications/:id/statement', to: 'applications#statement', as: 'applications_statement'
  post 'applications/:id/statement', to: 'applications#statement_next', as: 'applications_statement_next'
  get 'applications/:id/references', to: 'applications#references', as: 'applications_references'
  post 'applications/:id/references', to: 'applications#references_next', as: 'applications_references_next'
  get 'applications/:id/courses', to: 'applications#courses', as: 'applications_courses'
  post 'applications/:id/courses', to: 'applications#courses_next', as: 'applications_courses_next'
  get 'applications/:id/submit', to: 'applications#submit', as: 'applications_submit'
  post 'applications/:id/submit', to: 'applications#submit_next', as: 'applications_submit_next'

  devise_for :students
  resources :courses
  resources :colleges

  get 'home/index'
  get 'courses/category/:id', to: 'courses#category', as: 'courses_category'

  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
