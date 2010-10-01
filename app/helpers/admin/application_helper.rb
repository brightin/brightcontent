module Admin::ApplicationHelper
  
  # use partial if available
  def form_field(form, field_name)
    partial = find_partial("form_field_#{field_name}")
    return render(:partial => partial, :locals => {:f => form}) if partial
    return form.generic_field(field_name)
  end
  
  def list_field(item, field_name)
    partial = find_partial("list_field_#{field_name}")
    return render(:partial => partial, :locals => {:item => item, :field_name => field_name}) if partial
    return item.send(field_name)
  end
  
  def find_partial(name)
    [controller_path, "admin/default"].each do |prefix|
      return "#{prefix}/#{name}" if lookup_context.exists?(name, prefix, true)
    end
    nil
  end
  
  def error_message_on( item, field )
    return content_tag(:div, @item.errors[field].to_sentence, :class => 'error') if @item.errors[field].present?
    return ""
  end
  
  # nested form (used for assets)
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
     render(find_partial(association.to_s.singularize + "_fields"), :f => builder)
    end
    link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"), :class => 'add_field')
  end
  
  def invalid_fields(item)
    item.errors.map {|k,v| k if v }.compact
  end
end