require "brightcontent-core"
require "paperclip"
require "jquery-fileupload-rails"

require "brightcontent/attachments/engine"

module Brightcontent
  register_extension 'attachments'

  mattr_reader :attachment_content_types
  @@attachment_content_types = [/\Aimage/, "application/pdf"]

  module Attachments
    autoload :Attachable, 'brightcontent/attachments/attachable'
    autoload :ModelExtensions, 'brightcontent/attachments/model_extensions'
  end
end
