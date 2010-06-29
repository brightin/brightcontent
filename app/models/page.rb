class Page < ActiveRecord::Base
  has_many :assets, :as => :attachable, :dependent => :destroy
  accepts_nested_attributes_for :assets, :allow_destroy => true
  acts_as_list  :scope => :parent_id
  acts_as_tree  :order => :position
  scope :published, where("draft IS NULL")
  scope :visible, published.where("hidden IS NULL")
  validates_presence_of :name
  after_save { PageUrls.mark_dirty }
  
  def menu_item?
    published && visible
  end
  
  def is_last?
    self.parent.children.last == self if self.parent
  end
  
  def slug
    if url_name.blank?
      self.name.downcase.gsub(/[^a-z0-9']+/, "-")
    else
      url_name.downcase
    end
  end
  
  def url
    '/' + crumm[1..-1].map(&:slug).join('/')
  end
  
  def crumm
    ([self] + ancestors).reverse
  end
  
end