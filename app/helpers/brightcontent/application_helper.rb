module Brightcontent::ApplicationHelper
  
  # use partial if available
  def form_field(form, field_name)
    render_if_exists("form_field_#{field_name}", f: form) || form.generic_field(field_name)
  end
  
  def list_field(item, field_name)
    result = render_if_exists("list_field_#{field_name}", item: item, field_name: field_name)
    if result.nil?
      if item.class.column_names.include?(field_name) && item.column_for_attribute( field_name ).type == :boolean
        result = render_if_exists("list_field_boolean", item: item, field_name: field_name)
      end
      result = item.send(field_name) if result.nil?
    end
    result
  end
  
  def render_if_exists(*args)
    render *args
  rescue ActionView::MissingTemplate
    nil
  end
  
  def error_message_on( item, field )
    return content_tag(:div, item.errors[field].to_sentence, class: 'error') if item.errors[field].present?
    return ""
  end
  
  # nested form (used for assets)
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
     render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")", :class => 'add_field')
  end
  
  def invalid_fields(item)
    item.errors.map {|k,v| k if v }.compact
  end
end