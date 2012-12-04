ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'brightcontent'

Rails.backtrace_cleaner.remove_silencers!

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = true
end
