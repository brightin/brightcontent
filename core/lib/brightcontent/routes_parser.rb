require 'active_support/inflector'

module Brightcontent
  class RoutesParser

    def self.parse(routes_hash=nil, engine_resources=nil)
      new(routes_hash, engine_resources).user_resource
    end

    def initialize(routes_hash=nil, engine_resources=nil)
      @routes_hash = routes_hash
      @engine_resources = engine_resources
    end

    def user_resource
      resource_names - engine_resources
    end

    private

    def resource_names
      routes_hash.map do |route|
        if route && route[:action] == "index"
          route[:controller].match(/brightcontent\/(.+)/)[1]
        end
      end.compact.uniq
    end

    def routes_hash
      @routes_hash ||= Engine.routes.routes.map(&:defaults)
    end

    def engine_resources
      @engine_resources ||= Brightcontent.engine_resources
    end

  end
end
