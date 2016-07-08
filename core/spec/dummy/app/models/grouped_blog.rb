class GroupedBlog < ActiveRecord::Base
  belongs_to :author

  scope :exclude_inactive, ->{ where(active: true) }

  def self.ransackable_scopes(auth = nil)
    [:exclude_inactive]
  end
end
