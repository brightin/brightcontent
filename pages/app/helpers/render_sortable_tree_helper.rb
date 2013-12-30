module RenderSortableTreeHelper
  module Render
    def self.render_node(h, options)
      h.render("page", item: options[:node], children: options[:children], klass: options[:klass])
    end
  end
end
