require "brightcontent-core"
require "paperclip"
require "jquery-fileupload-rails"

require "brightcontent/attachments/engine"

module Brightcontent
  autoload :Attachable, 'brightcontent/attachable'
  autoload :AttachmentModelExtensions, 'brightcontent/attachment_model_extensions'

  module Attachments
  end
end
