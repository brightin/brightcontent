# Constraint object for routes

# TODO: This works only on a shared cache 
# like one development server or production with a memcacheserver 
# NOT on production with few mongrels and an in-memory-cache)

class PageUrls
    
  def initialize
    Rails.cache.write("PageUrls", Time.now, :unless_exists => true)
  end
  
  def matches?(request)
    reload if @timestamp != get_stamp
    @urls.include?(request.path.downcase)
  end

  def reload
    @urls = Page.all.map(&:url)
    @timestamp = get_stamp
  end  
  
  def get_stamp
    Rails.cache.read("PageUrls")
  end
  
  def self.mark_dirty
    Rails.cache.write("PageUrls", Time.now)
  end
  
end
