desc "Release all"
task "release:all" do
  version = File.read(File.expand_path("../../../VERSION",__FILE__)).strip
  sh "rake release"
  %w{core pages attachements}.each do |name|
    sh "cd #{name} && rake build && gem push pkg/brightcontent-#{name}-#{version}.gem"
  end
end
