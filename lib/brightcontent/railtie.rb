module Brightcontent
  class Railtie < Rails::Railtie
    initializer "require haml" do
       require "haml"
    end
    
    initializer 'require rails-i18n' do
      Dir[File.join(File.expand_path(File.dirname(__FILE__) + '/../../config/locales'), '*.yml')].each do |url|
        I18n.load_path << url
      end
    end
  end
end
