module Brightcontent
  class ApplicationController < ActionController::Base
    before_filter :authorize

    private

    def current_user
      @current_user ||= AdminUser.find(session[:brightcontent_user_id]) if session[:brightcontent_user_id]
    end
    helper_method :current_user

    def user_resources
      @user_resources ||= RoutesParser.new.resources
    end
    helper_method :user_resources

    def authorize
      redirect_to login_url if current_user.nil?
    end
  end
end
