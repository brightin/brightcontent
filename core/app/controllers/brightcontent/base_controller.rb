require_dependency "brightcontent/application_controller"

module Brightcontent
  class BaseController < ApplicationController
    inherit_resources
    helper_method :scopes_configuration

    include DefaultActions
    include Pagination

    private

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

  end
end
