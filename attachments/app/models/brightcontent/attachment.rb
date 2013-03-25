module Brightcontent
  class Attachment < ActiveRecord::Base
    attr_accessible :attachable_id, :attachable_type, :asset

    belongs_to :attachable, polymorphic: true, :inverse_of => :attachments
    has_attached_file :asset, :styles => lambda {|attachment| attachment.instance.attachment_styles }
    before_post_process :resize_images

    default_scope order("id")

    delegate :url, to: :asset

    validates :asset, attachment_presence: true

    def attachment_styles
      default_attachment_styles.merge(user_defined_styles)
    end

    def image?
      asset_content_type =~ %r{^(image|(x-)?application)/(bmp|gif|jpeg|jpg|pjpeg|png|x-png)$}
    end

    private

    def user_defined_styles
      if attachable && attachable.respond_to?(:attachment_styles) && image?
        attachable.attachment_styles
      end || {}
    end

    def default_attachment_styles
      { brightcontent: "100x100#", main: "200x200#" }
    end

    def resize_images
      return false unless image?
    end

  end
end
