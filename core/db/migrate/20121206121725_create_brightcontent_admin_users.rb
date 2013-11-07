class CreateBrightcontentAdminUsers < ActiveRecord::Migration
  def change
    create_table :brightcontent_admin_users do |t|
      t.string :email
      t.string :password_digest

      t.timestamps
    end

    Brightcontent::AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password => 'password')
  end
end
