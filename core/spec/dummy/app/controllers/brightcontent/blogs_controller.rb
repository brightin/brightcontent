class Brightcontent::BlogsController < Brightcontent::BaseController
  filter_fields %w[featured author]
end
