# namespace :brightcontent do
#   desc "Sync the migrations from the brightcontent plugin"
#   task :migrations do
#     migrations_path = Brightcontent::Engine.config.root.join("db/migrate")
#     system "rsync -ruv #{migrations_path} db"
#   end
# end
