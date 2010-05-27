namespace :arake do
	namespace :git do
		desc "Commit to a the git repository"
		task :commit, :commit, :files, :branch do |t, args|
			files = args[:files] || "."
			branch = args[:branch] || "master"
			system("git add #{files}")
			system("git commit -m '#{args[:commit]}'")
			system("git push origin #{branch}")
			
		end
	
		desc "Perform a git init and connect to a parent"
		task :init, :parent do |t, args|
			@arake.git_init(args[:parent])			
		end
	end
end
