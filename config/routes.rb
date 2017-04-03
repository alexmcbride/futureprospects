Rails.application.routes.draw do
  get 'applications/index'
  get 'applications/profile'
  post 'applications/profile', to: 'applications#profile_next', as: 'applications_profile_next'
  get 'applications/education'
  get 'applications/employment'
  get 'applications/statement'
  get 'applications/references'
  get 'applications/courses'
  get 'applications/submit'

  devise_for :students
  resources :courses
  resources :colleges

  get 'home/index'
  get 'courses/category/:id', to: 'courses#category', as: 'courses_category'

  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
