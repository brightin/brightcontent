require_dependency "brightcontent/application_controller"

module Brightcontent
  class SessionsController < ApplicationController
    skip_before_action :authorize

    def new
      redirect_to_return_to_or root_url if current_user
    end

    def create
      user = Brightcontent.user_model.authenticate(params[:email], params[:password])
      if user
        session[:brightcontent_user_id] = user.id
        redirect_to_return_to_or root_url
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

    def redirect_to_return_to_or(url, *args)
      if return_to = session[:return_to].presence
        session[:return_to] = nil
        redirect_to return_to, *args
      else
        redirect_to url, *args
      end
    end
  end
end
