require "inherited_resources"
require "simple_form"
require "jquery-rails"
require "will_paginate"
require "awesome_nested_set"
require "bootstrap-wysihtml5-rails"

require "brightcontent/rails/routes"
require "brightcontent/engine"

module Brightcontent

  autoload :Pagination, 'brightcontent/pagination'
  autoload :PageMethods, 'brightcontent/page_methods'
  autoload :RoutesParser, 'brightcontent/routes_parser'
  autoload :DefaultActions, 'brightcontent/default_actions'

  mattr_accessor :engine_resources
  @@engine_resources = %w{pages sessions admin_users}

  mattr_accessor :path
  @@path = "admin"

  mattr_accessor :application_name
  @@application_name = "Brightcontent"

  # Default way to setup Brightcontent.
  # Run rails g brightcontent:install to create initializer
  def self.setup
    yield self
  end

end
