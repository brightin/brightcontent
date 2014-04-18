require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/object/blank'

module Brightcontent
  Resources = Struct.new(:resources) do
    include Enumerable
    delegate :each, :==, to: :resources

    def main_menu
      take main_menu_count
    end

    def extra_menu
      drop main_menu_count
    end

    def extra_menu?
      resources.length > Brightcontent.main_menu_count
    end

    def main_menu_count
      Brightcontent.main_menu_count - (extra_menu? ? 1 : 0)
    end
  end
end
