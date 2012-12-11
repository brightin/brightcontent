module Brightcontent
  class Engine < ::Rails::Engine
    isolate_namespace Brightcontent

    initializer "Brightcontent precompile hook", :group => :all do |app|
      app.config.assets.precompile += ['brightcontent/brightcontent.js', 'brightcontent/brightcontent.css']
    end

    initializer "Include Brightcontent methods" do
      ActiveSupport.on_load(:action_controller) do
        include PageMethods
      end
      ActiveSupport.on_load(:action_view) do
        include PageMethods
      end
    end
  end
end
