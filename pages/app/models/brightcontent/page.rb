module Brightcontent
  class Page < ActiveRecord::Base
    attr_accessible :body, :name, :parent_id

    acts_as_nested_set
    include Brightcontent::Attachable

    validates_presence_of :name
    after_save :update_slug

    def self.default_scope
      order(:lft)
    end

    def homepage?
      lft == 1
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
