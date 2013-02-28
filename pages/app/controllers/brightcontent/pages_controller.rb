require_dependency "brightcontent/application_controller"

module Brightcontent
  class PagesController < BaseController
    per_page 99999

    def list_fields
      %w{name}
    end

    def form_fields
      %w{name parent_id hidden body attachments}
    end

  end
end
