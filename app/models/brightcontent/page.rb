module Brightcontent
  class Page < ActiveRecord::Base
    attr_accessible :body, :name
    before_validation :create_slug

    private

    def create_slug
      self.slug = name.parameterize
    end
  end
end
