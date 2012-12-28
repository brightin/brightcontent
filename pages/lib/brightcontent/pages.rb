require "brightcontent-core"
require "brightcontent-attachments"
require "awesome_nested_set"

require "brightcontent/pages/engine"

module Brightcontent

  mattr_accessor :page_attachment_styles
  @@page_attachment_styles = {}

  module Pages
    autoload :Methods, 'brightcontent/pages/methods'
  end
end
