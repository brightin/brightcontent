module Brightcontent
  module BaseControllerExt
    module Fields
      extend ActiveSupport::Concern

      included do
        %w[list_fields filter_fields form_fields default_fields].each do |name|
          class_eval <<-RUBY, __FILE__, __LINE__ + 1
            def self.#{name}(*fields)
              define_method(:#{name}) { fields.flatten }
            end
            helper_method :#{name}
          RUBY
        end
        helper_method :filter_fields_with_options
      end

      protected

      def list_fields
        default_fields
      end

      def filter_fields
        []
      end

      # Returns filter field definitions as a nested array.
      #
      #  [:foo, { bar: { as: :select }, qux: { as: :string } }]
      #
      # Becomes:
      #
      #  [[:foo], [:bar, { as: :select }], [:qux, { as: :string }]]
      #
      def filter_fields_with_options
        filter_fields.map do |field, result|
          field.is_a?(Hash) ? field.to_a : [[field]]
        end.flatten(1)
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
