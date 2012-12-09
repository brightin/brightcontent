require "inherited_resources"
require "simple_form"
require "jquery-rails"
require "will_paginate"
require "awesome_nested_set"

require "brightcontent/rails/routes"
require "brightcontent/engine"

module Brightcontent

  autoload :Pagination, 'brightcontent/pagination'
  autoload :PageMethods, 'brightcontent/page_methods'
  autoload :RoutesParser, 'brightcontent/routes_parser'
  autoload :DefaultActions, 'brightcontent/default_actions'

  # The default resources contained in the engine
  mattr_accessor :engine_resources
  @@engine_resources = %w{pages sessions users}

  # The path where the admin interface should mount
  mattr_accessor :path
  @@path = "admin"

  # Default way to setup Brightcontent.
  # Run rails g brightcontent:install to create initializer
  def self.setup
    yield self
  end

  # Prevent engine isolation of models
  # Watch out with migrations, still adds prefix
  def self.table_name_prefix
    nil
  end

  # Include helpers for controller
  def self.include_page_methods
    ActiveSupport.on_load(:action_controller) do
      include PageMethods
    end
    ActiveSupport.on_load(:action_view) do
      include PageMethods
    end
  end
end
