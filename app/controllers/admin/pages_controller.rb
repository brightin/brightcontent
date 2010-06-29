class Admin::PagesController < Admin::ApplicationController
  def create
    super
    @page.insert_at(params[:page][:position]||1)
  end
  
  def update
    @page = Page.find(params[:id])
    @page.remove_from_list
    @page.parent_id = params[:page][:parent_id]
    @page.insert_at(params[:page][:position]||1)
    super
  end  
  
  # ajax request
  def position_tag
    @page = Page.new()
    @page = Page.find(params[:id]) if params[:id]
    @page.parent_id = params[:parent_id]
  end
end