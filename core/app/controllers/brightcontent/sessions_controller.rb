require_dependency "brightcontent/application_controller"

module Brightcontent
  class SessionsController < ApplicationController
    skip_before_action :authorize

    def new
      redirect_after_login if current_user
    end

    def create
      user = Brightcontent.user_model.authenticate(params[:email], params[:password])
      if user
        session[:brightcontent_user_id] = user.id
        redirect_after_login
      else
        flash.now[:danger] = "Email or password is invalid"
        render :new
      end
    end

    def destroy
      session[:brightcontent_user_id] = nil
      session[:return_to] = nil
      redirect_to root_url
    end

    private

    def redirect_after_login
      redirect_to session.delete(:return_to).presence || root_url
    end
  end
end
