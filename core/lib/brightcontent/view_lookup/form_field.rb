module Brightcontent
  module ViewLookup
    class FormField < Abstract
      def render_default
        options[:form].input(options[:field].to_sym)
      end

      def field_type
        column = options[:form].send(:find_attribute_column, options[:field])
        options[:form].send(:default_input_type, options[:field], column, {})
      end
    end
  end
end
