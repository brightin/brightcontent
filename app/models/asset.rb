# Support for multiple (paperclip) assets in other models (polymorphic)
class Asset < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  has_attached_file :asset
  
  def image?
    ["image/jpeg", "image/pjpeg", "image/png", "image/x-png", "image/gif"].include?( asset_content_type )
  end
end
