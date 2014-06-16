class CreateBrightcontentAdminUsers < ActiveRecord::Migration
  def change
    create_table :brightcontent_admin_users do |t|
      t.string :email
      t.string :password_digest

      t.timestamps
    end

    attrs = {email: 'admin@example.com', password: 'password', password_confirmation: 'password'}
    if defined? ProtectedAttributes
      Brightcontent::AdminUser.create! attrs, without_protection: true
    else
      Brightcontent::AdminUser.create! attrs
    end
  end
end
