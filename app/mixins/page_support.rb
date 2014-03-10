# Mixin for using the Page-model in the frontend site
module PageSupport
  def self.included(base)
    base.send :before_filter, :set_page
    base.send :helper_method, :homepage?, :active?, :current?, :menu_item_classes
  end
  
  private
  
  # before_filter to set @page
  def set_page
    path = params[:path] || request.path
    path = "/#{path}" if !path.start_with?('/')
    @page = Page.all.detect{|p| p.url == path}
    
    if @page.nil?
      path = path [0..path.rindex('/')-1]
      @page = Page.all.detect{|p| p.url == path}
    end
  end
  
  # helpers
  def homepage?
    @page.homepage?
  end
  
  def active?(page)
    @page.path.include? page
  end
  
  def current?(page)
    @page == page
  end
  
  def menu_item_classes(page)
    classes = []
    classes << [:current] if current? page
    classes << [:active] if active? page
    classes << [:root] if page.homepage?
    classes
  end
end
