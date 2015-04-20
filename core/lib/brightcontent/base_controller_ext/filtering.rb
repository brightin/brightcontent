require 'active_support/concern'

module Brightcontent
  module BaseControllerExt
    module Filtering
      extend ActiveSupport::Concern

      included do
        helper_method :ransack_search
      end

      def ransack_search
        @_ransack_search ||= base_collection.ransack(params[:q])
      end

      def collection
        @_collection ||= ransack_search.result(distinct: true)
      end
    end
  end
end
