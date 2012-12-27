desc "Run all specs"
task :spec do
  sh "cd core && rake spec"
  sh "cd pages && rake spec"
  sh "cd attachments && rake spec"
end
