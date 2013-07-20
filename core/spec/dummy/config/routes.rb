Rails.application.routes.draw do
  resources :blogs

  brightcontent_resources do
    resources :blogs do
      resources :comments
    end
  end
end
