module Brightcontent
  class Attachment < ActiveRecord::Base
    belongs_to :attachable, polymorphic: true, :inverse_of => :attachments
    has_attached_file :asset, :styles => lambda {|attachment| attachment.instance.attachment_styles }
    before_post_process :resize_images
    before_create :set_position

    default_scope { order("position, id") }
    scope :for_attachable, -> type, id { where(attachable_type: type.classify, attachable_id: id) }

    delegate :url, to: :asset

    validates_attachment_content_type :asset, content_type: Brightcontent.attachment_content_types
    validates :attachable, presence: true
    validates :asset, attachment_presence: true

    attr_accessible *(column_names + [:asset]) if defined? ProtectedAttributes

    def self.reposition!(positions)
      positions.map! &:to_i
      transaction do
        all.each do |attachment|
          attachment.update_column :position, positions.index(attachment.id)
        end
      end
    end

    def attachment_styles
      default_attachment_styles.merge(user_defined_styles)
    end

    def image?
      asset_content_type =~ %r{^(image|(x-)?application)/(bmp|gif|jpeg|jpg|pjpeg|png|x-png)$}
    end

    private

    def user_defined_styles
      if attachable && attachable.class.attachment_styles && image?
        attachable.class.attachment_styles
      end || {}
    end

    def default_attachment_styles
      { brightcontent: "100x100#", main: "200x200#" }
    end

    def resize_images
      return false unless image?
    end

    def set_position
      self.position ||= self.class.for_attachable(attachable_type, attachable_id).maximum(:position).to_i + 1
    end
  end
end
