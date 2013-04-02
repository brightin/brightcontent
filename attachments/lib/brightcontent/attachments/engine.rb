module Brightcontent
  module Attachments
    class Engine < ::Rails::Engine
      initializer "Add attachments class method" do
        ActiveSupport.on_load(:active_record) do
          include AttachmentModelExtensions
        end
      end
    end
  end
end
