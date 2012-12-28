module Brightcontent
  class Engine < ::Rails::Engine
    isolate_namespace Brightcontent

    initializer "Brightcontent precompile hook", :group => :all do |app|
      app.config.assets.precompile += ['brightcontent/brightcontent.js', 'brightcontent/brightcontent.css']
    end

    initializer "Add ActiveRecord column" do
      ActiveSupport.on_load(:active_record) do
        include ModelExtensions
      end
    end
  end
end
