module Brightcontent
  module BaseControllerExt
    module DefaultActions
      def show
        if request.format == :html
          redirect_to action: :edit
        else
          show!
        end
      end

      def create
        create! { resource_redirect_path }
      end

      def update
        update! { resource_redirect_path }
      end

      def destroy
        destroy! { resource_index_path }
      end

      private

      def resource_redirect_path
        if params["commit_and_continue"].present?
          resource_item_path
        else
          resource_index_path
        end
      end
    end
  end
end
