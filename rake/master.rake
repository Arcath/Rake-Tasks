Dir.glob('ArcathRake/*.rake').each { |r| import r unless r == "master.rake" }

namespace :arake do
	desc "A test"
	task :test do
		puts "test"
	end
end
