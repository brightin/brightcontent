desc "Run all specs"
task :spec do
  sh "cd core && bundle exec rake spec"
  sh "cd pages && bundle exec rake spec"
  sh "cd attachments && bundle exec rake spec"
end
