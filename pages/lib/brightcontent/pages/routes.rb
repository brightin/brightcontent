module ActionDispatch::Routing
  class Mapper
    def pages_resources(&block)
      resources :pages do
        collection do
          get :index
          post :rebuild
        end
        instance_eval &block if block_given?
      end
    end
  end
end
