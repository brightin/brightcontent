class CreateBrightcontentAdminUsers < ActiveRecord::Migration
  def up
    create_table :brightcontent_admin_users do |t|
      t.string :email
      t.string :password_digest
      t.timestamps
    end

    if defined? Brightcontent::AdminUser
      Brightcontent::AdminUser.create!(
        email: 'admin@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
    end
  end

  def down
    drop_table :brightcontent_admin_users
  end
end
