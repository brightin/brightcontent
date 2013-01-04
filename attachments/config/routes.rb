Brightcontent::Engine.routes.draw do
  # TODO: put instead of create
  get 'attachments/:type/:id' => 'attachments#show', as: :attachments
  put 'attachments' => 'attachments#create', as: :new_attachment
  delete 'attachments/:id' => 'attachments#destroy', as: :destroy_attachment
end
