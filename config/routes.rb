Rails.application.routes.draw do
  resources :courses
  resources :colleges

  get 'home/index'
  get 'courses/category/:id', to: 'courses#category', as: 'courses_category'

  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
