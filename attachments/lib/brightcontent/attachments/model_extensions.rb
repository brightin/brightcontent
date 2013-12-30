module Brightcontent
  module Attachments
    module ModelExtensions
      extend ActiveSupport::Concern

      module ClassMethods
        attr_reader :attachment_styles

        def has_attached_files(styles)
          include ::Brightcontent::Attachments::Attachable
          @attachment_styles = styles
        end
      end
    end
  end
end
