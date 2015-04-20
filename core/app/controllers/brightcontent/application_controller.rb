module Brightcontent
  class ApplicationController < ActionController::Base
    add_flash_types :success, :info, :warning, :danger
    before_filter :authorize
    before_filter :set_locale
    helper TranslationHelper
    protect_from_forgery

    def index
      redirect_to polymorphic_url(user_resources.first.klass)
    end

    private

    def set_locale
      I18n.locale = Brightcontent.locale
    end

    def current_user
      @current_user ||= begin
        Brightcontent.user_model.find(session[:brightcontent_user_id]) if session[:brightcontent_user_id]
      end
    end
    helper_method :current_user

    def user_resources
      @user_resources ||= RoutesParser.new.resources
    end
    helper_method :user_resources

    def authorize
      redirect_to login_url unless current_user
    end
  end
end
