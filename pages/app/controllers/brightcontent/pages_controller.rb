require_dependency "brightcontent/application_controller"

module Brightcontent
  class PagesController < BaseController

    def list_fields
      %w{name}
    end

    def form_fields
      %w{name parent_id hidden body attachments}
    end

  end
end
