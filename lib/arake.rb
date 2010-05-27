class Arake
	require 'yaml'
	def initialize(runfrom)
		@runfrom=runfrom
	end
	
	def directory
		@directory || set_directory && @directory
	end
	
	def directory=(s)
		File.open("directory.yml", File::WRONLY|File::TRUNC|File::CREAT) { |out| YAML.dump({"directory" => s}, out) }
	end
	
	def gitignore
		gitentries = YAML::load_file("#{directory}/config/gitignore.yml")["lines"]
		File.open(".gitignore","a") do |file|
			gitentries.map { |line| file.puts line }
		end
	end
	
	def git_init(parent)
		unless parent then
			puts "Guessing Parent on GitHub"
			parent = git_parent
		end
		`git init`
		system("git remote add origin #{parent}")
	end
	
	private
	
	def set_directory
		installdir=File.dirname(__FILE__).gsub("/lib","")
		@directory = YAML::load_file("#{installdir}/directory.yml")["directory"]
	end
	
	def git_parent
		"git@github.com:#{git_user_name}/#{@runfrom.scan(/.*\/(.*?)$/).join}.git"
	end
	
	def git_user_name
		(`git config --get user.name`).gsub("\n","")
	end
end
