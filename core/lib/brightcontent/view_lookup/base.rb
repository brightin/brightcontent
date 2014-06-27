require 'active_support/inflector'

module Brightcontent
  module ViewLookup
    class Base
      attr_reader :options, :view_context

      def initialize(view_context, options)
        @view_context = view_context
        @options = options
      end

      def call
        render_by_field_name || render_by_type || render_by_association_type || render_default
      end

      private

      def render_by_field_name
        render("#{name}_#{options[:field]}", options)
      end

      def render_by_type
        return unless field_type
        render "brightcontent/base/#{name.pluralize}/#{field_type}", options
      end

      def render_by_association_type
        return unless association_type
        render "brightcontent/base/#{name.pluralize}/#{association_type}", options
      end

      def render_default
        field_value
      end

      def field_type
        resource_class.columns_hash[options[:field].to_s].try :type
      end

      def association_type
        association.try :macro
      end

      def name
        self.class.name.demodulize.underscore
      end

      def field_value
        options[:item].send(options[:field])
      end

      def association
        resource_class.reflect_on_association options[:field].to_sym
      end

      def resource_class
        view_context.send :resource_class
      end

      def render(*args)
        view_context.render_if_exists(*args)
      end
    end
  end
end
