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

    initializer "Set default locale from main app" do
      ActiveSupport.on_load(:after_initialize) do
        Brightcontent.locale ||= I18n.default_locale
      end
    end
  end
end
