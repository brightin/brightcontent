class DropBrightcontentPages < ActiveRecord::Migration
  def change
    drop_table :brightcontent_pages
  end
end
