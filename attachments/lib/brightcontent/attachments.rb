require "brightcontent-core"
require "paperclip"
require "jquery-fileupload-rails"

require "brightcontent/attachments/engine"

module Brightcontent
  register_extension 'attachments'

  module Attachments
    autoload :Attachable, 'brightcontent/attachments/attachable'
    autoload :ModelExtensions, 'brightcontent/attachments/model_extensions'
  end
end
