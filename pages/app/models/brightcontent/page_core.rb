module Brightcontent
  module PageCore
    extend ActiveSupport::Concern

    included do
      attr_accessible :body, :name, :parent_id, :hidden
      acts_as_nested_set
      include Brightcontent::Attachable

      validates_presence_of :name
      after_save :update_slug
    end

    module ClassMethods
      def default_scope
        order(:lft)
      end
    end

    def homepage?
      lft == 1
    end

    def url
      "/" + slug
    end

    def attachment_styles
      Brightcontent.page_attachment_styles
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

