module Brightcontent
  module BaseControllerExt
    module Fields
      extend ActiveSupport::Concern

      module ClassMethods
        def define_setting(name)
          class_eval <<-RUBY
            def self.#{name}(*fields)
              define_method(:#{name}) { fields.flatten }
            end
            helper_method :#{name}
          RUBY
        end
      end

      included do
        define_setting :list_fields
        define_setting :form_fields
        define_setting :default_fields
      end

      protected

      def list_fields
        default_fields
      end

      def form_fields
        default_fields
      end

      def default_fields
        resource_class.brightcontent_columns - %w{id created_at updated_at password_digest}
      end
    end
  end
end
