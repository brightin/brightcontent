require "inherited_resources"
require "simple_form"
require "jquery-rails"
require "will_paginate"

require "brightcontent/rails/routes"
require "brightcontent/routes_parser"
require "brightcontent/engine"

module Brightcontent
  # Prevent engine isolation of models
  def self.table_name_prefix
    nil
  end
end
