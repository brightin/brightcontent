module Brightcontent
  module ViewLookup
    class FilterField < Base
      def render_default
        options[:form].input(input_name, input_options.merge(collection: collection))
      end

      private

      def controller
        view_context.controller
      end

      def column?
        resource_class.column_names.include? options[:field].to_s
      end

      def scope?
        resource_class.ransackable_scopes.include?(options[:field].to_sym)
      end

      def belongs_to_association?
        association.try :belongs_to?
      end

      def field_name
        if belongs_to_association?
          association.foreign_key
        else
          options[:field]
        end
      end

      def input_name
        if predicate
          "#{field_name}_#{predicate}"
        else
          field_name.to_s
        end
      end

      def filter_options
        options[:options] || {}
      end

      def predicate
        filter_options.fetch(:predicate) { default_predicate }
      end

      def default_predicate
        if scope?
          false
        elsif as_string?
          "cont"
        else
          "eq"
        end
      end

      def input_options
        default_input_options.merge(filter_options.except(:predicate))
      end

      def collection
        collection = filter_options[:collection]

        if collection.respond_to?(:call)
          collection.call
        elsif collection.is_a?(Symbol) && controller.respond_to?(collection, true)
          controller.send(collection)
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
          as:            default_type,
          include_blank: true
        }
      end

      def default_type
        (column? || belongs_to_association?) ? :select : :string
      end

      def default_collection
        if column?
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
