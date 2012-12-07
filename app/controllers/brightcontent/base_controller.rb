require_dependency "brightcontent/application_controller"

module Brightcontent
  class BaseController < ApplicationController
    inherit_resources
    helper_method :collection_name, :list_fields, :form_fields

    def show
      redirect_to action: :edit
    end

    private

    def collection_name
      resource_class.to_s.humanize.pluralize
    end

    def list_fields
      form_fields
    end

    def form_fields
      resource_class.column_names - %w{id created_at updated_at password_digest}
    end

  end
end
