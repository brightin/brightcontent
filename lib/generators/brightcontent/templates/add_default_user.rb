class AddDefaultUser < ActiveRecord::Migration
  def up
    Brightcontent::User.create!(:email => 'admin@example.com', :password => 'password')
  end

  def down
    Brightcontent::User.find_by_email('admin@example.com').delete
  end
end
