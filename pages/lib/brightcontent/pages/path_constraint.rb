module Brightcontent
  module Pages
    class PathConstraint
      CACHE_KEY = :brightcontent_page_slugs

      def self.expire
        Rails.cache.delete(CACHE_KEY)
      end

      def matches?(request)
        slug = Brightcontent.page_model.sanitize_path(request.path)
        cached_page_slugs.include?(slug)
      end

      private

      def cached_page_slugs
        Rails.cache.fetch(CACHE_KEY) { page_slugs }
      end

      def page_slugs
        Brightcontent.page_model.pluck(:slug)
      end
    end
  end
end
