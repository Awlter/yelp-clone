Rails.application.routes.draw do
  root to: 'businesses#index'

  get 'register', to: 'users#new'
  get 'log_in', to: 'sessions#new'
  post 'log_in', to: 'sessions#create'
  get 'log_out', to: 'sessions#destroy'

  resources :users, only: [:create]
  resources :businesses, only: [:index, :new, :create, :show]

  get 'ui/(:action)', controller: 'ui'
end
