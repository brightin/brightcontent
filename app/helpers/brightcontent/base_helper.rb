module Brightcontent
  module BaseHelper
    def render_list_field(item, field)
      render_if_exists("list_field_#{field}", item: item) || item.send(field).truncate(50)
    end

    def render_form_field(form, field)
      render_if_exists("form_field_#{field}", form: form, item: form.object) || form.input(field.to_sym)
    end

    def render_if_exists(*args)
      render *args
    rescue ActionView::MissingTemplate
      nil
    end
  end
end
