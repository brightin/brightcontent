module Brightcontent
  class ApplicationController < ActionController::Base
    before_filter :authorize

    private

    def current_user
      @current_user ||= User.find(session[:brightcontent_user_id]) if session[:brightcontent_user_id]
    end
    helper_method :current_user

    def authorize
      redirect_to login_url, alert: "Not authorized" if current_user.nil?
    end
  end
end
