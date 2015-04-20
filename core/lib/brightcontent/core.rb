# Make SimpleForm helpers available in Ransack's search form:
# https://github.com/activerecord-hackery/ransack#using-simpleform
#
ENV['RANSACK_FORM_BUILDER'] ||= '::SimpleForm::FormBuilder'

require "bootstrap-sass"
require "bootstrap-wysihtml5-rails"
require "ransack"
require "jquery-rails"
require "simple_form"
require "will_paginate"
require "will_paginate-bootstrap"

require "brightcontent/rails/routes"
require "brightcontent/engine"

module Brightcontent
  autoload :ModelExtensions, 'brightcontent/model_extensions'
  autoload :Resource, 'brightcontent/resource'
  autoload :Resources, 'brightcontent/resources'
  autoload :RoutesParser, 'brightcontent/routes_parser'
  autoload :StrongParamsFix, 'brightcontent/strong_params_fix'
  autoload :ViewLookup, 'brightcontent/view_lookup'
  autoload :BaseControllerExt, 'brightcontent/base_controller_ext'

  mattr_accessor :locale

  mattr_reader :extensions
  @@extensions = %w{core}

  mattr_accessor :engine_resources
  @@engine_resources = %w{sessions admin_users}

  mattr_accessor :path
  @@path = "admin"

  mattr_accessor :application_name
  @@application_name = "Brightcontent"

  mattr_writer :user_model
  def self.user_model
    @@user_model.is_a?(String) ? @@user_model.constantize : @@user_model
  end
  @@user_model = "Brightcontent::AdminUser"

  mattr_accessor :main_menu_count
  @@main_menu_count = 6

  def self.setup
    yield self
  end

  def self.register_extension(name)
    @@extensions << name
  end
end
