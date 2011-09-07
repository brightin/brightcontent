module Brightcontent
  class Engine < Rails::Engine
    # isolate_namespace Brightcontent
    config.assets.precompile += %w( brightcontent/custom.css )
  end
end
