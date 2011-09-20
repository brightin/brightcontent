class RenamePasswordToPasswordDigest < ActiveRecord::Migration
  
  class User < ActiveRecord::Base
    has_secure_password
  end
  
  def self.up
    rename_column :users, :password, :password_digest
    
    User.all.each do |u|
      password = u.password_digest
      password = SecureRandom.hex if password.nil? || password.empty?
      u.password = password
      u.password_confirmation = password
      u.save!
    end
    
  end

  def self.down
    rename_column :users, :password_digest, :password
  end
end