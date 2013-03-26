module Brightcontent
  class PageBaseController < BaseController
    include TheSortableTreeController::Rebuild
    helper TheSortableTree::Engine.helpers

    per_page 99999


    def form_fields
      %w{name parent_id hidden body attachments}
    end

    protected

    def sortable_model
      Brightcontent::Page
    end

    def sortable_collection
      "brightcontent_pages"
    end
  end
end
