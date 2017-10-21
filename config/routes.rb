Rails.application.routes.draw do
  root to: 'ui#index'
  get 'ui/(:action)', controller: 'ui'

  resources :businesses, only: [:index, :new]
end
