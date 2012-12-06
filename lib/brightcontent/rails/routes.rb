module ActionDispatch::Routing
  class Mapper
    def brightcontent_namespace(name, &block)
      set_namespace(name)
      mount_engine
      define_resources(&block) if block_given?
    end

    private

    def set_namespace(name)
      Brightcontent.namespace = name
    end

    def mount_engine
      mount Brightcontent::Engine => Brightcontent.namespace
    end

    def define_resources(&block)
      namespace Brightcontent.namespace, &block
    end
  end
end
