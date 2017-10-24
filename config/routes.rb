Rails.application.routes.draw do
  root to: 'businesses#index'

  get 'register', to: 'users#new'
  get 'log_in', to: 'sessions#new'
  post 'log_in', to: 'sessions#create'
  get 'log_out', to: 'sessions#destroy'
  get 'reviews', to: 'reviews#index'

  resources :users, only: [:create]
  resources :businesses, only: [:index, :new, :create, :show] do
    resources :reviews, only: [:create]
  end

  get 'ui/(:action)', controller: 'ui'
end
