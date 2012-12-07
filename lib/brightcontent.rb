require "inherited_resources"
require "simple_form"
require "jquery-rails"
require "will_paginate"

require "brightcontent/rails/routes"
require "brightcontent/routes_parser"
require "brightcontent/default_actions"
require "brightcontent/pagination"
require "brightcontent/engine"

module Brightcontent
  # Keys that should have whitespace stripped.
  mattr_accessor :engine_resources
  @@engine_resources = %w{pages sessions users}

  # Prevent engine isolation of models
  # Watch out with migrations, still adds prefix
  def self.table_name_prefix
    nil
  end
end
