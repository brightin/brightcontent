module Brightcontent
  class Engine < ::Rails::Engine
    isolate_namespace Brightcontent

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
