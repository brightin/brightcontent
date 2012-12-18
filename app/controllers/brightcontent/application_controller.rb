module Brightcontent
  class ApplicationController < ActionController::Base
    before_filter :authorize
    helper_method :resource_paths, :current_user
    layout "brightcontent/application"

    private

    def current_user
      @current_user ||= AdminUser.find(session[:brightcontent_user_id]) if session[:brightcontent_user_id]
    end

    def authorize
      redirect_to login_url, alert: "Not authorized" if current_user.nil?
    end

    def resource_paths
      RoutesParser.parse
    end
  end
end
