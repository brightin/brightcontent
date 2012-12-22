module Brightcontent
  module Pages
    module Generators
      class InstallGenerator < Rails::Generators::Base

        desc "Install migrations for Brightcontent Pages"

        def copy_migrations
          rake "brightcontent_pages_engine:install:migrations"
        end

      end
    end
  end
end
