module Brightcontent
  class Page < ActiveRecord::Base
    include Brightcontent::PageCore
    attr_accessible *column_names if defined? ProtectedAttributes
  end
end
