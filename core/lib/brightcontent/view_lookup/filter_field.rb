module Brightcontent
  module ViewLookup
    class FilterField < Base
      def render_default
        raise "invalid filter field: #{options[:field]}" unless field_name
        options[:form].input(:"#{field_name}_#{predicate}", input_options.merge(collection: collection))
      end

      private

      def field?
        resource_class.column_names.include? options[:field].to_s
      end

      def belongs_to_association?
        association.try :belongs_to?
      end

      def field_name
        if field?
          options[:field]
        elsif belongs_to_association?
          association.foreign_key
        end
      end

      def filter_options
        options[:options] || {}
      end

      def predicate
        filter_options[:predicate] || default_predicate
      end

      def default_predicate
        as_string? ? "cont" : "eq"
      end

      def input_options
        default_input_options.merge(filter_options.except(:predicate))
      end

      def collection
        collection = filter_options[:collection]

        if collection.respond_to?(:call)
          collection.call
        elsif collection.is_a?(Symbol) && view_context.respond_to?(collection)
          view_context.send(collection)
        elsif collection
          collection
        elsif as_collection?
          default_collection
        end
      end

      def as_collection?
        %i(select radio_buttons check_boxes).include?(input_options[:as].to_sym)
      end

      def as_string?
        %i(string search).include?(input_options[:as].to_sym)
      end

      def default_input_options
        {
          label:         options[:field].to_s.humanize,
          input_html:    { class: "form-control input-sm" },
          required:      false,
          as:            :select,
          include_blank: true
        }
      end

      def default_collection
        if field?
          field_type == :boolean ? raw_collection : raw_collection.sort
        elsif belongs_to_association?
          association.klass.where(association.association_primary_key => raw_collection)
        end
      end

      def raw_collection
        resource_class.uniq.pluck(field_name)
      end
    end
  end
end
