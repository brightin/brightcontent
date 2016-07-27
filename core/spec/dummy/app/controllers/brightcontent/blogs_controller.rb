class Brightcontent::BlogsController < Brightcontent::BaseController
  filter_fields :featured, :author, name: { as: :string }, name_or_comments_text: { label: "Find" }, exclude_inactive: { as: :boolean }
end
