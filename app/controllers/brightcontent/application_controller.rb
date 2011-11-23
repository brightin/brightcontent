class Brightcontent::ApplicationController < ActionController::Base
  include Brightcontent::DefaultActions
  before_filter :login_required
  respond_to :html, :xml, :json
  
  def initialize
    @brightcontent_controllers = Rails.application.routes.routes.map{|r| r.defaults[:controller] if r.defaults[:action] == "index" }
    @brightcontent_controllers.map!{ |c| c.split(%r(^brightcontent/))[1] if c }.compact!.uniq!
    @brightcontent_controllers -= ['assets']
    super
  end
  
  private
  
  def login_required
    if User.find_by_id(session['brightcontent_user_id']).nil?
      session['brightcontent_return_to'] = request.url
      redirect_to new_brightcontent_session_url
    else
      @current_user = User.find_by_id(session['brightcontent_user_id'])
    end
  end
  
  def current_user
    @current_user
  end
end