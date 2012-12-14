module Brightcontent
  module PagesHelper
    def page_selector(current_page)
      Page.all.map do |page|
        "#{page_prefix(page.depth)} #{page.name}" if page != current_page
      end.compact
    end

    def page_prefix(depth)
      "-" * depth
    end
  end
end
