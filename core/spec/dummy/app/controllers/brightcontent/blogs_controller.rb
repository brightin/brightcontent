class Brightcontent::BlogsController < Brightcontent::BaseController
  filter_fields :featured, :author, name: { as: :string }
end
