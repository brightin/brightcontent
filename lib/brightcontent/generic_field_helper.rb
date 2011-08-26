module Brightcontent::GenericFieldHelper
  def generic_field(attribute, options={})
    case @object.class.columns.find{|c| c.name == attribute}.type
       when :string
         text_field( attribute, options )
       when :boolean
         check_box( attribute, options )
        when :text
          text_area( attribute, options )
       else
         text_field( attribute, options )
     end
  end
end

ActionView::Helpers::FormBuilder.send :include, Brightcontent::GenericFieldHelper
