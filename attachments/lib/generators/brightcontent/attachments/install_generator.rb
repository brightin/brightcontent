module Brightcontent
  module Attachments
    module Generators
      class InstallGenerator < Rails::Generators::Base
        desc "Install migrations for Brightcontent Attachments"
        def copy_migrations
          rake "brightcontent_attachments_engine:install:migrations"
        end
      end
    end
  end
end
