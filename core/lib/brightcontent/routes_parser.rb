require 'active_support/inflector'

module Brightcontent
  class RoutesParser
    def initialize(routes_hash = nil, engine_resources = Brightcontent.engine_resources)
      @routes_hash = routes_hash
      @engine_resources = engine_resources
    end

    def resources
      Resources.new(resources_array)
    end

    private

    attr_reader :engine_resources

    def resources_array
      (resource_names - engine_resources).map do |name|
        Resource.new(name)
      end
    end

    def resource_names
      routes_hash.map do |route|
        next unless route && route[:controller] && route[:path_spec]
        name = route[:controller].match(/brightcontent\/(.+)/)[1]
        if route[:action] == "index" && route[:path_spec].start_with?('/' + name)
          name
        end
      end.compact.uniq
    end

    def routes_hash
      @routes_hash ||= Engine.routes.routes.map do |r|
        {
          controller: r.defaults[:controller],
          action: r.defaults[:action],
          path_spec: r.path.spec.to_s
        }
      end
    end
  end
end
