require 'active_support/inflector'

module Brightcontent
  module ViewLookup
    class Abstract
      attr_reader :options, :view_context

      def initialize(view_context, options)
        @view_context = view_context
        @options = options
      end

      def call
        render_by_field_name || render_by_type || render_default
      end

      private

      def render_by_field_name
        render("#{name}_#{options[:field]}", options)
      end

      def render_by_type
        return unless field_type
        render("brightcontent/base/#{name.pluralize}/#{field_type}", options)
      end

      def render_default
        field_value
      end

      def field_type
        NotImplementedError
      end

      def name
        self.class.name.demodulize.underscore
      end

      def field_value
        value = options[:item].send(options[:field])
      end

      def render(*args)
        view_context.render_if_exists(*args)
      end
    end
  end
end
