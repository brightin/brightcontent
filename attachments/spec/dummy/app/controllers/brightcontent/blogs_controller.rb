class Brightcontent::BlogsController < Brightcontent::BaseController
  private

  def list_fields
    %w{name}
  end

  def form_fields
    %w{name assets}
  end
end
