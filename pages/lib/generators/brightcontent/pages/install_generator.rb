module Brightcontent
  module Pages
    module Generators
      class InstallGenerator < Rails::Generators::Base

        desc "Install migrations for Brightcontent Pages"

        def copy_migrations
          rake "brightcontent_pages_engine:install:migrations"
        end

        def add_routes
          inject_into_file 'config/routes.rb', "\n    pages_resources", { :after => "brightcontent_resources do" }
        end

      end
    end
  end
end
