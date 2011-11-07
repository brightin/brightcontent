module Brightcontent
  class Railtie < Rails::Railtie
    initializer "require haml" do
       require "haml"
    end
  end
end
