module Brightcontent
  class Engine < ::Rails::Engine
    isolate_namespace Brightcontent

    initializer "Brightcontent precompile hook", :group => :all do |app|
      app.config.assets.precompile += ['brightcontent/brightcontent.js', 'brightcontent/brightcontent.css']
    end
  end
end
