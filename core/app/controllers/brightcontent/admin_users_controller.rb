require_dependency "brightcontent/application_controller"

module Brightcontent
  class AdminUsersController < BaseController
    form_fields :email, :password, :password_confirmation

    def resource_class
      Brightcontent.user_model
    end
  end
end
