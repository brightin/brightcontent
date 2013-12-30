module Brightcontent
  module PageCore
    extend ActiveSupport::Concern

    included do
      include TheSortableTree::Scopes

      has_attached_files Brightcontent.page_attachment_styles
      acts_as_nested_set

      validates_presence_of :name

      after_save :update_slug
      after_move :update_slug

      default_scope { order(:lft) }
    end

    def homepage?
      lft == 1
    end

    def path
      "/" + slug
    end

    private

    def update_slug
      update_column(:slug, slug_name.to_s)
    end

    def slug_name
      unless homepage?
        self_and_ancestors.map { |p| p.name.parameterize }.join("/")
      end
    end
  end
end
