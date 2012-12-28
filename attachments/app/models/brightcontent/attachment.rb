module Brightcontent
  class Attachment < ActiveRecord::Base
    attr_accessible :attachable_id, :attachable_type, :asset

    belongs_to :attachable, polymorphic: true
    has_attached_file :asset, styles: ->(a){ a.instance.attachment_styles }
    delegate :url, to: :asset

    validates :asset, attachment_presence: true

    def attachment_styles
      @paperclip_options ||= default_attachment_styles
    end

    private

    def default_attachment_styles
      { cms: "100x100#" }
    end

  end
end
