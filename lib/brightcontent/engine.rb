module Brightcontent
  class Engine < ::Rails::Engine
    isolate_namespace Brightcontent

    initializer "Brightcontent precompile hook", :group => :all do |app|
      app.config.assets.precompile += ['brightcontent/brightcontent.js', 'brightcontent/brightcontent.css']
    end

    initializer "Include Brightcontent methods" do
      Brightcontent.include_page_methods
    end
  end
end
