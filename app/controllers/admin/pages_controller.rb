class Admin::PagesController < Admin::ApplicationController
  def create
    super
    @page.insert_at(params[:page][:position] || 1) unless @page.new_record?
  end
  
  def update
    @page = Page.find(params[:id])
    @page.remove_from_list
    @page.parent_id = params[:page][:parent_id]
    @page.insert_at(params[:page][:position] || 1)
    super
  end  
  
  # used by the form via ajax
  def parent_specific_info
    @page = Page.find_by_id(params[:id]) || Page.new
    @page.parent = Page.find(params[:parent_id])
  end
end