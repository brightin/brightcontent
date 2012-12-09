Brightcontent::Engine.routes.draw do
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  resources :users
  resources :pages
  resources :sessions, only: [:new, :create, :destroy]

  root to: "pages#index"
end
