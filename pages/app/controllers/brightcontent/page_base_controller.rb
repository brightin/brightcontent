module Brightcontent
  class PageBaseController < BaseController
    include TheSortableTreeController::Rebuild
    helper TheSortableTree::Engine.helpers

    def self.inherited(subclass)
      super(subclass)
      subclass.class_eval do
        per_page 0
      end
    end

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
