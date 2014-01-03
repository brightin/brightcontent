module Brightcontent
  module ViewLookup
    class ListField < Abstract
      def render_default
        view_context.strip_tags(field_value.to_s).truncate(50)
      end

      def field_type
        options[:item].column_for_attribute(options[:field]).try(:type)
      end
    end
  end
end
