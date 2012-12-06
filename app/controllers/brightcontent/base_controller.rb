require_dependency "brightcontent/application_controller"

module Brightcontent
  class BaseController < ApplicationController
    inherit_resources
    helper_method :collection_name, :list_fields

    private

    def collection_name
      resource_class.to_s.humanize.pluralize
    end

    def list_fields
      resource_class.column_names - %w{created_at updated_at password_digest}
    end
  end
end
