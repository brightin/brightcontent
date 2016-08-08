require 'active_support/concern'

module Brightcontent
  module BaseControllerExt
    module Pagination
      extend ActiveSupport::Concern

      included do
        helper_method :items_per_page
        helper_method :current_page
        helper_method :page_sizes
        helper_method :corrected_page
        helper_method :page_sizes_visible?
      end

      module ClassMethods
        def per_page_count
          @page_size = page_sizes.min
        end

        def per_page(number)
          @page_sizes = [number]
        end

        def page_size_options(sizes)
          return unless sizes.is_a? Array
          @page_sizes = sizes
        end

        def page_sizes
          @page_sizes ||= [30]
        end
      end

      private

      def items_per_page
        per_page = params[:per_page].try(:to_i)
        @items_per_page =
          if per_page && page_sizes.include?(per_page)
            per_page.to_i
          else
            self.class.per_page_count
          end
      end

      def page_sizes_visible?(collection)
        total_entries = collection.count

        if total_entries.respond_to?(:size) && !total_entries.is_a?(Integer)
          total_entries = total_entries.size
        end

        page_sizes.length > 1 && total_entries > page_sizes.min
      end

      def current_page
        params[:page].try(:to_i) || 1
      end

      def corrected_page(size)
        (current_page - 1) * items_per_page / size + 1
      end

      def page_sizes
        self.class.page_sizes
      end

      def collection
        if action_name == "index" && items_per_page > 0
          super.paginate(page: params[:page], per_page: items_per_page)
        else
          super
        end
      end
    end
  end
end
