require 'csv'
require_dependency "brightcontent/application_controller"

module Brightcontent
  class BaseController < ApplicationController
    inherit_resources
    respond_to :all

    include BaseControllerExt::DefaultActions
    include BaseControllerExt::Pagination
    include BaseControllerExt::Fields

    def permitted_params
      params.permit!
    end

    def resource_params
      [permitted_params[resource_instance_name]]
    end

    protected

    def parent
      super if parent?
    end
    helper_method :parent

    def resource_item_path
      [parent, resource]
    end
    helper_method :resource_item_path

    def resource_index_path
      [parent, resource_class]
    end
    helper_method :resource_index_path
  end
end
