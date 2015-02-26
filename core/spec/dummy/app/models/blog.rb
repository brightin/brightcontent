class Blog < ActiveRecord::Base
  belongs_to :author
  has_many :comments

  scope :featured, ->{ where(:featured => true) }
  scope :exclude_inactive, ->{ where(active: true) }

  def self.ransackable_scopes(auth = nil)
    [:exclude_inactive]
  end
end
