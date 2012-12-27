ENV["RAILS_ENV"] = "test"
ENGINE_RAILS_ROOT = File.join(File.dirname(__FILE__), '../')

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'factory_girl_rails'
require 'brightcontent-attachments'

Dir[File.join(ENGINE_RAILS_ROOT, "spec/support/**/*.rb")].each {|f| require f }

Rails.backtrace_cleaner.remove_silencers!

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.include FactoryGirl::Syntax::Methods
end
