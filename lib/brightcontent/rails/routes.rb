module ActionDispatch::Routing
  class Mapper
    def brightcontent_namespace(name, &block)
      define_user_resources(&block) if block_given?
      mount Brightcontent::Engine => name
    end

    private

    def define_user_resources(&block)
      Brightcontent::Engine.routes.draw do
        instance_eval &block
      end
    end
  end
end
