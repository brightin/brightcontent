require 'active_support/inflector'

module Brightcontent
  class RoutesParser

    def self.parse(routes_hash=nil)
      new(routes_hash).resources
    end

    def initialize(routes_hash=nil)
      @routes_hash = routes_hash || Engine.routes.routes.map(&:defaults)
    end

    def resources
      resources_names.map { |name| name.classify.constantize }
    end

    private

    def resources_names
      controllers_paths.map { |path| path.split("brightcontent/").last } - Brightcontent.engine_resources
    end

    def controllers_paths
      @routes_hash.map { |route| route[:controller] if route && route[:action]=="index" }.compact
    end

  end
end
