module Brightcontent
  module BaseHelper
    def render_list_field(item, field)
      ViewLookup::ListField.new(self, item: item, field: field).call
    end

    def render_filter_field(form, field, options)
      ViewLookup::FilterField.new(self, field: field, form: form, options: options).call
    end

    def render_form_field(form, field)
      ViewLookup::FormField.new(self, item: form.object, field: field, form: form).call
    end

    def render_if_exists(*args)
      render(*args)
    rescue ActionView::MissingTemplate
      nil
    end

    # Returns filter field definitions as a nested array.
    #
    #  [:foo, { bar: { as: :select }, qux: { as: :string } }]
    #
    # Becomes:
    #
    #  [[:foo], [:bar, { as: :select }], [:qux, { as: :string }]]
    #
    def normalized_filter_fields
      filter_fields.flat_map do |field|
        field.is_a?(Hash) ? field.to_a : [[field]]
      end
    end
  end
end
