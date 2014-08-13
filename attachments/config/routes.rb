Brightcontent::Engine.routes.draw do
  get 'attachments/:type/:id' => 'attachments#show', as: :attachments
  post 'attachments/:type/:id/reposition' => 'attachments#reposition'
  match 'attachments' => 'attachments#create', as: :new_attachment, via: [:put, :patch]
  delete 'attachments/:id' => 'attachments#destroy', as: :destroy_attachment
end
