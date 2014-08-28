require "brightcontent-core"
require "brightcontent-attachments"
require "awesome_nested_set"
require "jquery-ui-rails"
require "the_sortable_tree"

require "brightcontent/pages/routes"
require "brightcontent/pages/engine"

module Brightcontent
  register_extension 'pages'

  mattr_accessor :page_attachment_styles
  @@page_attachment_styles = {}

  mattr_writer :page_model
  def self.page_model
    @@page_model.is_a?(String) ? @@page_model.constantize : @@page_model
  end
  @@page_model = "Brightcontent::Page"

  module Pages
    autoload :Methods, 'brightcontent/pages/methods'
    autoload :PathConstraint, 'brightcontent/pages/path_constraint'
  end
end
