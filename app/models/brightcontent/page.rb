module Brightcontent
  class Page < ActiveRecord::Base
    acts_as_nested_set
    attr_accessible :body, :name, :parent_id

    validates_presence_of :name

    after_save :update_slug

    default_scope order('lft')

    def homepage?
      lft == 1
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
