Brightcontent::Engine.routes.draw do
  get 'attachments/:type/:id' => 'attachments#show', as: :attachments
  post 'attachments/:type/:id/reposition' => 'attachments#reposition'
  put 'attachments' => 'attachments#create', as: :new_attachment
  delete 'attachments/:id' => 'attachments#destroy', as: :destroy_attachment
end
