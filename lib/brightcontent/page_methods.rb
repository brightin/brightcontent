module Brightcontent
  module PageMethods
    def current_page
      @current_page ||= Page.find_by_slug!(request.fullpath[1..-1])
    end
  end
end
