Rails.application.routes.draw do
  resources :blogs

  brightcontent_resources do
    resources :blogs
  end

  root to: "pages#index"
  get "*path" => "pages#show"
end
