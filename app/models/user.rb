class User < ActiveRecord::Base
  attr_accessible :email_address, :password, :password_confirmation  
  has_secure_password  
  
  validates :email_address,   
            :presence => true,   
            :uniqueness => true,   
            :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i

  validates_presence_of :password, :on => :create  

  def self.authenticate(email_address, password)
    find_by_email_address(email_address).try(:authenticate, password)
  end
  
  def before_save
    self.email_address.downcase!
  end
end