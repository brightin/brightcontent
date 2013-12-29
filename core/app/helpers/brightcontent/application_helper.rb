module Brightcontent
  module ApplicationHelper
    def avatar_url(user)
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
      "https://gravatar.com/avatar/#{gravatar_id}.png?s=30&d=mm"
    end
  end
end
