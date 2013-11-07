Rails.application.routes.draw do
  brightcontent_resources do
    pages_resources
  end
  root to: "pages#index"
  get "*path" => "pages#show"
end
