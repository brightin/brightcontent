# DOC:
# We use Helper Methods for tree building,
# because it's faster than View Templates and Partials

# SECURITY note
# Prepare your data on server side for rendering
# or use h.html_escape(node.content)
# for escape potentially dangerous content
module RenderSortableTreeHelper
  module Render 
    class << self
      attr_accessor :h, :options

      def render_node(h, options)
        @h, @options = h, options

        node = options[:node]

        "
          <li id='#{ node.id }_#{ options[:klass] }'>
            <div class='item #{"page-hidden" if node.hidden? }'>
              <i class='handle'></i>
              #{show_link}
              #{controls}
            </div>
            #{children}
          </li>
        "
      end

      def show_link
        node = options[:node]
        ns   = options[:namespace]
        url  = h.url_for(ns + [node])
        title_field = options[:title]

        h.link_to(node.send(title_field), url, class: 'link')
      end

      def controls
        node = options[:node]

        edit_path = h.url_for(:controller => options[:klass].pluralize, :action => :edit, :id => node)
        show_path = h.url_for(:controller => options[:klass].pluralize, :action => :show, :id => node)

        "
          <div class='controls'>
            #{ h.link_to 'Edit', edit_path, :class => 'btn btn-xs btn-primary btn-edit' }
            #{ h.link_to 'Delete', show_path, :class => 'btn btn-xs btn-danger', :method => :delete, :data => { :confirm => 'Are you sure?' } }
          </div>
        "
      end

      def children
        unless options[:children].blank?
          "<ol class='nested_set'>#{ options[:children] }</ol>"
        end
      end

    end
  end
end
