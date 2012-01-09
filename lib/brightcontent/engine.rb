module Brightcontent
  class Engine < Rails::Engine
    # isolate_namespace Brightcontent
    # Enabling assets precompiling under rails 3.1
    # if Rails.version >= '3.1'
    #     initializer :assets do |config|
    #       Rails.application.config.assets.precompile += %w( wymeditor/wymeditor.css wymeditor/wymeditor.js brightcontent/custom.css )
    #     end
    #   end
  end
end
