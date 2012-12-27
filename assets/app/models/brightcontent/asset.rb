module Brightcontent
  class Asset < ActiveRecord::Base
    attr_accessible :attachable_id, :attachable_type, :asset

    belongs_to :attachable, :polymorphic => true
    has_attached_file :asset

    validates :asset, :attachment_presence => true
  end
end
