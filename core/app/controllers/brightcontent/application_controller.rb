module Brightcontent
  class ApplicationController < ActionController::Base
    add_flash_types :success, :info, :warning, :danger
    before_filter :authorize
    before_filter :set_locale
    helper TranslationHelper

    def index
      redirect_to root_path + user_resources.first.path
    end

    private

    def set_locale
      I18n.locale = Brightcontent.locale
    end

    def current_user
      @current_user ||= Brightcontent.user_model.find(session[:brightcontent_user_id]) if session[:brightcontent_user_id]
    end
    helper_method :current_user

    def user_resources
      @user_resources ||= @current_user.resources
    end
    helper_method :user_resources

    def authorize
      redirect_to login_url unless current_user
    end
  end
end
