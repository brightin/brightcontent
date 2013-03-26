Brightcontent::Engine.routes.draw do
  resources :pages do
    collection do
      get :index
      post :rebuild
    end
  end
  root to: "pages#index"
end
