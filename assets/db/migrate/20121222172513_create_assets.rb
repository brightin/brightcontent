class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :brightcontent_assets do |t|
      t.integer  :attachable_id
      t.string   :attachable_type
      t.string   :asset_file_name
      t.string   :asset_content_type
      t.integer  :asset_file_size
      t.datetime :asset_updated_at
      t.timestamps
    end
    add_index :brightcontent_assets, :attachable_id
    add_index :brightcontent_assets, :attachable_type
  end

  def self.down
    drop_table :brightcontent_assets
  end
end
