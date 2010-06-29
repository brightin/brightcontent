class Admin::ApplicationController < ActionController::Base
  include DefaultActions
  include DefaultViews
  before_filter :login_required
  respond_to :html, :xml, :json
  
  def initialize
    @admin_controllers = Rails.application.routes.routes.map{|r| r.defaults[:controller] if r.defaults[:action] == "index" }
    @admin_controllers.map!{ |c| c.split(%r(^admin/))[1] if c }.compact!.uniq!
    @admin_controllers -= ['assets']
    super
  end
  
  private
  
  def login_required
    if User.find_by_id(session['admin_user_id']).nil?
      session['admin_return_to'] = request.request_uri
      redirect_to new_admin_session_url
    else
      @current_user = User.find_by_id(session['admin_user_id'])
    end
  end
end