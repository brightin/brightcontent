module Brightcontent
  module BaseHelper
    def render_list_field(item, field)
      render_if_exists("list_field_#{field}", item: item) || strip_tags(item.send(field).to_s).truncate(50)
    end

    def render_form_field(form, field)
      render_if_exists("form_field_#{field}", form: form, item: form.object) ||
      render_if_exists("brightcontent/fields/#{field_type(form, field)}", form: form, item: form.object, field: field) ||
      form.input(field.to_sym)
    end

    def link_for_scope(scope)
      case scope[:type]
      when :boolean
        polymorphic_url(resource_index_path, scope[:as] => true)
      end
    end

    private

    def render_if_exists(*args)
      render *args
    rescue ActionView::MissingTemplate
      nil
    end

    def field_type(form, field)
      column = form.send(:find_attribute_column, field)
      form.send(:default_input_type, field, column, {})
    end
  end
end
