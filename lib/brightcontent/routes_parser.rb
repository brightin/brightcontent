require 'active_support/inflector'

class RoutesParser

  def self.parse(routes_hash=nil)
    new(routes_hash).resources
  end

  def initialize(routes_hash=nil)
    @routes_hash = routes_hash || Rails.application.routes.routes.map(&:defaults)
  end

  def resources
    controllers_paths.map { |path| path.split("brightcontent/").last.humanize }
  end

  private

  def controllers_paths
    @routes_hash.map { |route| route[:controller] if route && route[:action]=="index" }.compact
  end

end
