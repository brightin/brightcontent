# Mixin for admin controllers
# if template in </views/admin/***/action> doesn't exist, use <..default/action> 
module Admin::DefaultViews
  def render_to_body(options)
    options[:prefix] = replace_prefix(options[:prefix], options[:template])
    super(options)
  end
  
  private
  def replace_prefix(prefix, template)
    return prefix if prefix.nil? || template.nil?
    return prefix if template_exists?("#{prefix}/#{template}")
    alt_prefix = prefix[0,prefix.rindex("/")] + "/default"
    return alt_prefix if template_exists?("#{alt_prefix}/#{template}")
  end
end