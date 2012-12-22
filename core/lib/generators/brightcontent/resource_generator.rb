module Brightcontent
  module Generators
    class ResourceGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)

      desc "Creates Brightcontent controller, route and empty views dir"

      def generate_controller
        template "brightcontent_controller.rb", "app/controllers/brightcontent/#{@name.pluralize.underscore}_controller.rb"
      end

      def generate_views_directory
        empty_directory "app/views/brightcontent/#{name.pluralize.underscore}"
      end

      def add_route
        inject_into_file 'config/routes.rb', "\n    resources :#{name.pluralize.underscore}", { :after => "brightcontent_resources do" }
      end

    end
  end
end
