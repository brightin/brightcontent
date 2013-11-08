require 'csv'
require_dependency "brightcontent/application_controller"

module Brightcontent
  class BaseController < ApplicationController
    inherit_resources
    helper_method :scopes_configuration
    respond_to :all

    include DefaultActions
    include Pagination

    def permitted_params
      params.permit!
    end

    def resource_params
      [permitted_params[resource_instance_name]]
    end

    protected

    def list_fields
      default_fields - %w{attachments}
    end
    helper_method :list_fields

    def form_fields
      default_fields
    end
    helper_method :form_fields

    def default_fields
      resource_class.brightcontent_columns - %w{id created_at updated_at password_digest}
    end
    helper_method :default_fields

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
