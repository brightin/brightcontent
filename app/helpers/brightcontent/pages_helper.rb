module Brightcontent::PagesHelper
  
  def page_pairs(page, current, prefix='')
    return [] if page.nil? or current == page
    result = [[prefix + page.name, page.id]]
    page.children.each {|p| result += page_pairs(p, current, prefix + '-')} 
    result
  end
  
  def position_pairs(page)
    pages = page.siblings
    return [] if pages.size < 1 || page.parent_id.nil?
    i = 1
    result = [["above: #{pages[0].name} (#{i})", i]]
    result + pages.map {|p| ["under: #{p.name} (#{i+=1})",i] }
  end
  
  def tree_images(page, depth, skip_last=false)
    return "" if page == page.root
    result = ""
    
    page.ancestors[0..-2].reverse.each do |p|
      name = Page.where(:parent_id => p.parent_id).order("position DESC").first == p ? "empty" : "l"
      result += image_tag( "brightcontent/#{name}.gif", :class => 'page_tree')
    end
    
    filename = "t"
    # Ideally we want to use 'if page.last?' but acts_as_list/rails3.2 has an issue with sanitizetizing a hash in acts_as_list->list.rb
    filename = "end" if Page.where(:parent_id => page.parent_id).order("position DESC").first == page
    filename = "empty" if skip_last
    return result + image_tag("brightcontent/#{filename}.gif", :class => 'page_tree')
  end
  
  def parent_path(page)
    parent_path = request.protocol + request.host_with_port
    parent_path += page.parent.url unless page.parent.nil? || page.parent.url == "/"
    parent_path += "/"
    parent_path
  end
  
end
