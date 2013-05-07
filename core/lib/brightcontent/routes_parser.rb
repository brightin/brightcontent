require 'active_support/inflector'

module Brightcontent
  class RoutesParser

    def initialize(routes_hash=nil, engine_resources=nil)
      @routes_hash = routes_hash
      @engine_resources = engine_resources
    end

    def resources
      (resource_names - engine_resources).map do |name|
        Resource.new(name)
      end
    end

    class Resource < Struct.new(:path)
      def klass
        path.classify.constantize
      rescue
        "Brightcontent::#{path.classify}".constantize
      end

      def ==(other)
        path == other.path
      end
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
