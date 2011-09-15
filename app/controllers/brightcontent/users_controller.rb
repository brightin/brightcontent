class Brightcontent::UsersController < Brightcontent::ApplicationController
  respond_to :html
  
  before_filter :set_form_fields, only: %w[new edit update]
  
  private
  
  def set_form_fields
    @form_fields ||= model.column_names + %w[password password_confirmation] - %w[created_at updated_at password_digest]
  end
end