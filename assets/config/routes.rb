Brightcontent::Engine.routes.draw do
  resources :assets, only: [:create, :destroy]
end
