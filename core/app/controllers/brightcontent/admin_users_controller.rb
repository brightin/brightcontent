require_dependency "brightcontent/application_controller"

module Brightcontent
  class AdminUsersController < BaseController
    def form_fields
      %w{email password password_confirmation}
    end
  end
end
