module Brightcontent
  module BaseHelper
    def render_list_field(item, field)
      ViewLookup::ListField.new(self, item: item, field: field).call
    end

    def render_form_field(form, field)
      ViewLookup::FormField.new(self, item: form.object, field: field, form: form).call
    end
  end
end
