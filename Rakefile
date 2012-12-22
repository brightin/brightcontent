begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'bundler'
Bundler::GemHelper.install_tasks

Dir[File.expand_path('../lib/tasks/**/*', __FILE__)].each do |task|
  load task
end

task :default => :spec
