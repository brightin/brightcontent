desc "Run all specs"
multitask spec: [:spec_core, :spec_pages, :spec_attachments]

task :spec_core do
  sh 'cd core && bundle exec rake'
end

task :spec_pages do
  sh 'cd pages && bundle exec rake'
end

task :spec_attachments do
  sh 'cd attachments && bundle exec rake'
end
