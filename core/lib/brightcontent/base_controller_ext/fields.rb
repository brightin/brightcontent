module Brightcontent
  module BaseControllerExt
    module Fields
      extend ActiveSupport::Concern

      included do
        helper_method :list_fields, :form_fields, :default_fields
      end

      module ClassMethods
        def _list_fields
          @_list_fields ||= _default_fields - %w{attachments}
        end

        def _form_fields
          @_form_fields ||= _default_fields
        end

        def _default_fields
          @_default_fields ||=
            resource_class.brightcontent_columns - %w{id created_at updated_at password_digest}
        end

        def list_fields(*fields)
          @_list_fields = fields
        end

        def form_fields(*fields)
          @_form_fields = fields
        end

        def default_fields(*fields)
          @_default_fields = fields
        end
      end

      protected

      def list_fields
        self.class._list_fields
      end

      def form_fields
        self.class._form_fields
      end

      def default_fields
        self.class._default_fields
      end
    end
  end
end
