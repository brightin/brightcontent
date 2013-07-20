module Brightcontent
  module PageCore
    extend ActiveSupport::Concern

    included do
      acts_as_nested_set
      has_attached_files Brightcontent.page_attachment_styles
      include Brightcontent::Attachable
      include TheSortableTree::Scopes
      validates_presence_of :name
      after_save :update_slug
      after_move :update_slug
    end

    module ClassMethods
      def default_scope
        order(:lft)
      end
    end

    def homepage?
      lft == 1
    end

    def path
      "/" + slug
    end

    def root_parent_children
      root? ? children : ancestors.first.children
    end

    private

    def update_slug
      self.update_column(:slug, slug_name)
    end

    def slug_name
      homepage? ? "" : self_and_ancestors.map { |p| p.name.parameterize }.join("/")
    end
  end
end

