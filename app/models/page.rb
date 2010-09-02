class Page < ActiveRecord::Base
  has_many :assets, :as => :attachable, :dependent => :destroy
  accepts_nested_attributes_for :assets, :allow_destroy => true
  acts_as_list  :scope => :parent_id
  acts_as_tree  :order => :position
  scope :published, where(:draft => false)
  scope :visible, published.where(:hidden => false)
  validates_presence_of :title, :name
  validates_presence_of :url_name, :unless => :homepage?
  validates_format_of :url_name, :with => /^[-a-z0-9]+$/, :if => "url_name.present?"
  after_save { PageUrls.mark_dirty }
  
  def self.root_with_children
    [root] + root.children
  end
  
  def self.visible_root_with_children
    [root] + root.children.visible
  end
  
  def initialize(*)
    super
    self.parent = Page.root
  end
  
  def menu_item?
    published && visible
  end
  
  def is_last?
    self.parent.children.last == self if self.parent
  end
  
  def homepage?
    self.parent.nil?
  end
  
  def url
    '/' + path[1..-1].map(&:url_name).join('/')
  end
  
  def path
    ([self] + ancestors).reverse
  end
  
  def get_all_page_images
    self.assets
  end
  
end