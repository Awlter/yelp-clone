Rails.application.routes.draw do
  root to: 'businesses#index'

  get 'register', to: 'users#new'

  resources :users, only: [:create]
  resources :businesses, only: [:index, :new]

  get 'ui/(:action)', controller: 'ui'
end
