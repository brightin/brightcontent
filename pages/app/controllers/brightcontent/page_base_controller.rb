module Brightcontent
  class PageBaseController < BaseController
    include TheSortableTreeController::Rebuild
    helper TheSortableTree::Engine.helpers

    def self.inherited(subclass)
      subclass.class_eval { per_page 0 }
      super
    end

    def form_fields
      %w{name parent_id hidden body attachments}
    end

    def sortable_model
      Brightcontent.page_model
    end

    def resource_class
      Brightcontent.page_model
    end

    protected

    def sortable_collection
      "brightcontent_pages"
    end
  end
end
