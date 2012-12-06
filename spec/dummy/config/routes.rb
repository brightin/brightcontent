Rails.application.routes.draw do
  resources :blogs

  brightcontent_namespace 'admin' do
    resources :blogs
  end
end
