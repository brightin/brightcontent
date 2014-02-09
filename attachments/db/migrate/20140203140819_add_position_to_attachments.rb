class AddPositionToAttachments < ActiveRecord::Migration
  def change
    add_column :brightcontent_attachments, :position, :integer
  end
end
