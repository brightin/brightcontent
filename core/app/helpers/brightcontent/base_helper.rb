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
  end
end
