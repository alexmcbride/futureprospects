Rails.application.routes.draw do
  get 'courses/search'

  resources :courses

  get 'home/index'
  get 'courses/category/:id', to: 'courses#category', as: 'courses_category'

  get 'colleges/:id', to: 'colleges#index', as: 'college'
  get 'colleges', to: 'colleges#index', as: 'colleges'


  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
