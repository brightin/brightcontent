module Brightcontent
  module BaseHelper
    def render_list_field(item, field)
      render_if_exists("list_field_#{field}") || item.send(field)
    end

    def render_form_field(form, field)
      form.input(field.to_sym)
    end

    def render_if_exists(*args)
      render *args
    rescue ActionView::MissingTemplate
      nil
    end
  end
end
