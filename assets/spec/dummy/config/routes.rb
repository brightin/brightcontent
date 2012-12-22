Rails.application.routes.draw do
  brightcontent_resources do
  end
  root to: "pages#index"
  get "*path" => "pages#show"
end
