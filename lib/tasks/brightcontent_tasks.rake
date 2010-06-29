namespace :brightcontent do
  desc "Sync the migrations and assets in the public folder from the brightcontent plugin"
  task :sync do 
    system "rsync -ruv vendor/plugins/brightcontent/db/migrate db" 
    system "rsync -ruv vendor/plugins/brightcontent/public/admin public" 
  end
end