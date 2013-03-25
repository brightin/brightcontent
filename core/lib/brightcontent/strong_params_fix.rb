module Brightcontent
  module StrongParamsFix

    def build_resource
      get_resource_ivar || set_resource_ivar(end_of_association_chain.send(method_for_build, params_for_build))
    end

    def params_for_build
      request.get? ? {} : resource_params
    end

    def update_resource(object, attributes)
      object.update_attributes(attributes)
    end
  end
end
