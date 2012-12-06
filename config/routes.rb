Brightcontent::Engine.routes.draw do
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  resources :users
  resources :pages
  resources :sessions

  root to: "pages#index"
end
