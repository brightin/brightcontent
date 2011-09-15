class User < ActiveRecord::Base
  attr_accessible :email_address, :password, :password_confirmation  
  has_secure_password  
  validates_presence_of :password, :on => :create  

  def self.authenticate(email_address, password)
    find_by_email_address_and_password(email_address.downcase, password)
  end
  
  def before_save
      self.email_address.downcase!
  end
end