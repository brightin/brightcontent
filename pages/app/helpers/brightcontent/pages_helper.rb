module Brightcontent
  module PagesHelper
    def page_selector(current_page)
      Brightcontent.page_model.all.map do |page|
        ["#{page_prefix(page.depth)} #{page.name}", page.id] if page != current_page
      end.compact
    end

    def page_prefix(depth)
      "-" * depth
    end
  end
end
