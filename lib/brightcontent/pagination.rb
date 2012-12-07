require 'active_support/concern'

module Brightcontent
  module Pagination
    extend ActiveSupport::Concern

    module ClassMethods
      def per_page(number)
        @per_page_count = number
      end

      def per_page_count
        @per_page_count || 30
      end
    end

    private

    def collection
      collection ||= end_of_association_chain.paginate(page: params[:page], per_page: self.class.per_page_count)
    end

  end
end
