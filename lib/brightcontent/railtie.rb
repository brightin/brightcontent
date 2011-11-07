module Brightcontent
  class Railtie < Rails::Railtie
    initializer "require haml" { require "haml" }
  end
end
