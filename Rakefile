begin
  require 'bundler/setup'
  require 'bundler/gem_tasks'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

PROJECTS = %w{core pages attachments}

PROJECTS.each do |name|
  task "spec_#{name}" do
    sh "cd #{name} && bundle exec rake db:schema:load spec RAILS_ENV=test"
  end
end

desc "run specs for all projects"
multitask spec: PROJECTS.map { |name| "spec_#{name}" }
task :default => :spec

desc "Release new versions of all projects"
task "release:all" do
  version = File.read(File.expand_path("../VERSION", __FILE__)).strip
  sh "rake release"
  PROJECTS.each do |name|
    sh "cd #{name} && rake build && gem push pkg/brightcontent-#{name}-#{version}.gem"
  end
end
