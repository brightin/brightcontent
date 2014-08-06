module Brightcontent
  module ViewLookup
    class ListField < Base
      def render_default
        view_context.strip_tags(field_value.to_s).truncate(50)
      end
    end
  end
end
