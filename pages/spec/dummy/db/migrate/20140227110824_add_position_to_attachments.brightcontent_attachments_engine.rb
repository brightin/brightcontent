# This migration comes from brightcontent_attachments_engine (originally 20140203140819)
class AddPositionToAttachments < ActiveRecord::Migration
  def change
    add_column :brightcontent_attachments, :position, :integer
  end
end
