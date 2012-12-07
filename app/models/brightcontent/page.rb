module Brightcontent
  class Page < ActiveRecord::Base
    attr_accessible :body, :name, :slug
  end
end
