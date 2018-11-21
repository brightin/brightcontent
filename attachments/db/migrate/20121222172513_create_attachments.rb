class CreateAttachments < ActiveRecord::Migration[4.2]
  def up
    create_table :brightcontent_attachments do |t|
      t.integer  :attachable_id
      t.string   :attachable_type
      t.string   :asset_file_name
      t.string   :asset_content_type
      t.integer  :asset_file_size
      t.datetime :asset_updated_at
      t.integer  :position
      t.timestamps
    end

    add_index :brightcontent_attachments, :attachable_id
    add_index :brightcontent_attachments, :attachable_type
  end

  def down
    drop_table :brightcontent_attachments
  end
end
