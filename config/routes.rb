Rails.application.routes.draw do
  get 'applications/:id', to: 'applications#index', as: 'applications_index'
  get 'applications/:id/profile', to: 'applications#profile', as: 'applications_profile'
  post 'applications/:id/profile', to: 'applications#profile_next', as: 'applications_profile_next'
  get 'applications/:id/education', to: 'applications#education', as: 'applications_education'
  get 'applications/:id/employment', to: 'applications#employment', as: 'applications_employment'
  get 'applications/:id/statement', to: 'applications#statement', as: 'applications_statement'
  get 'applications/:id/references', to: 'applications#references', as: 'applications_references'
  get 'applications/:id/courses', to: 'applications#courses', as: 'applications_courses'
  get 'applications/:id/submit', to: 'applications#submit', as: 'applications_submit'

  devise_for :students
  resources :courses
  resources :colleges

  get 'home/index'
  get 'courses/category/:id', to: 'courses#category', as: 'courses_category'

  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
