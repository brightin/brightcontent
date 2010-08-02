module Admin::PagesHelper
  
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
      name = p.last? ? "empty" : "l"
      result += image_tag( "/admin/images/#{name}.gif")
    end
    
    filename = "t"
    filename = "end" if page.last?
    filename = "empty" if skip_last
    return result + image_tag("/admin/images/#{filename}.gif")
  end
  
end
