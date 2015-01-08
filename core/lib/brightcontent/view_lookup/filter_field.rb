module Brightcontent
  module ViewLookup
    class FilterField < Base
      def render_default
        raise "invalid filter field: #{options[:field]}" unless field_name
        options[:form].input(:"#{field_name}_eq", input_options)
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

      def input_options
        # Load the collection if a proc is given.
        if options[:collection] && options[:collection].respond_to?(:call)
          options[:collection] = options[:collection].call
        end

        default_input_options.merge(options[:options] || {})
      end

      def default_input_options
        {
          label:         options[:field].to_s.humanize,
          input_html:    { class: "form-control input-sm" },
          required:      false,
          as:            :select,
          collection:    default_collection,
          include_blank: true
        }
      end

      def default_collection
        if field?
          field_type == :boolean ? raw_options : raw_options.sort
        elsif belongs_to_association?
          association.klass.where(association.association_primary_key => raw_options)
        end
      end

      def raw_options
        resource_class.uniq.pluck(field_name)
      end
    end
  end
end
