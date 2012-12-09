module Brightcontent
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Creates a Brightcontent initializer, copy migrations, edit routes file"

      def copy_initializer
        template "initializer.rb", "config/initializers/brightcontent.rb"
      end

      def copy_migrations
        rake "brightcontent:install:migrations"
      end

      def add_routes
        route "brightcontent_namespace 'admin' do\n" \
        "    #resources :vacancies  #for example\n" \
        "  end"
      end

      def copy_custom_assets
        copy_file "../../../../app/assets/stylesheets/brightcontent/custom.css", "app/assets/stylesheets/brightcontent/custom.css"
        copy_file "../../../../app/assets/javascripts/brightcontent/custom.js", "app/assets/javascripts/brightcontent/custom.js"
      end

      def setup_directory
        empty_directory "app/controllers/brightcontent"
      end
    end
  end
end
