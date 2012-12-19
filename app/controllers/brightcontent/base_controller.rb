require_dependency "brightcontent/application_controller"

module Brightcontent
  class BaseController < ApplicationController
    inherit_resources

    include DefaultActions
    include Pagination

    private

    def list_fields
      form_fields
    end
    helper_method :list_fields

    def form_fields
      default_fields
    end
    helper_method :form_fields

    def default_fields
      resource_class.column_names - %w{id created_at updated_at password_digest}
    end

  end
end
