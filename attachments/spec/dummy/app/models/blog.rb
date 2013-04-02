class Blog < ActiveRecord::Base
  has_attached_files test: "200x200"
end
