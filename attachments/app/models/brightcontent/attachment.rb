module Brightcontent
  class Attachment < ActiveRecord::Base
    attr_accessible :attachable_id, :attachable_type, :asset

    belongs_to :attachable, polymorphic: true
    has_attached_file :asset, styles: ->(a){ a.instance.attachment_styles }
    delegate :url, to: :asset

    validates :asset, attachment_presence: true

    def attachment_styles
      user_defined_styles.merge(default_attachment_styles)
    end

    private

    def user_defined_styles
      if attachable && attachable.respond_to?(:attachment_styles)
        attachable.attachment_styles
      end || {}
    end

    def default_attachment_styles
      { brightcontent: "100x100#" }
    end

  end
end
