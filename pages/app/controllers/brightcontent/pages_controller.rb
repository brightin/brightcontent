require_dependency "brightcontent/application_controller"

module Brightcontent
  class PagesController < BaseController
    private

    def list_fields
      default_fields - %w{body depth lft rgt parent_id slug}
    end

    def form_fields
      default_fields - %w{slug depth lft rgt}
    end

  end
end
