module Brightcontent
  class Asset < ActiveRecord::Base
    belongs_to :attachable, :polymorphic => true
    has_attached_file :asset

    validates :asset, :attachment_presence => true
  end
end
