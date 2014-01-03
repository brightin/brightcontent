require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/object/blank'

module Brightcontent
  Resources = Struct.new(:resources) do
    include Enumerable
    delegate :each, :==, to: :resources

    def main_menu
      take(Brightcontent.main_menu_count)
    end

    def extra_menu
      drop(Brightcontent.main_menu_count)
    end

    def extra_menu?
      extra_menu.present?
    end
  end
end
