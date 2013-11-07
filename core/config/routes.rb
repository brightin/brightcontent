Brightcontent::Engine.routes.draw do
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  resources :admin_users
  resources :sessions, only: [:new, :create, :destroy]

  root to: "application#index"
end
