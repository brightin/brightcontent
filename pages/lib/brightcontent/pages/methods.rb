module Brightcontent
  module Pages
    module Methods
      def current_page
        @current_page ||= Brightcontent.page_model.find_by_path(request.path)
      end

      def current_page!
        @current_page ||= Brightcontent.page_model.find_by_path!(request.path)
      end
    end
  end
end
