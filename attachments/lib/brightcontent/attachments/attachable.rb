module Brightcontent
  module Attachments
    module Attachable
      extend ActiveSupport::Concern

      included do
        add_brightcontent_column :attachments
        has_many :attachments, as: :attachable, dependent: :destroy, class_name: "Brightcontent::Attachment", inverse_of: :attachable
      end

      def attachment
        attachments.first
      end
    end
  end
end
