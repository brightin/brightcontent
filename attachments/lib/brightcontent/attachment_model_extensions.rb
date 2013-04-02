module Brightcontent
  module AttachmentModelExtensions
    extend ActiveSupport::Concern

    module ClassMethods
      attr_reader :attachment_styles
      def has_attached_files(styles)
        include Brightcontent::Attachable
        @attachment_styles = styles
      end
    end
  end
end
