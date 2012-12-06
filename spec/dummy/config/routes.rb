Rails.application.routes.draw do
  brightcontent_namespace 'admin' do
    resources :blogs
  end
end
