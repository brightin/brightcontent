module Brightcontent
  module Pages
    class Engine < ::Rails::Engine
      initializer "Include Page methods" do
        ActiveSupport.on_load(:action_controller) do
          include Methods
        end
        ActiveSupport.on_load(:action_view) do
          include Methods
        end
      end
    end
  end
end
