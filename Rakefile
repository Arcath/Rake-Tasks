desc "Installs the Rake Tasks"
task :setup do
	@arake.directory=File.dirname(__FILE__)
	system "ln -s #{@arake.directory}/bin/setup.rb /usr/bin/arcathrake"
	system "chmod 755 /usr/bin/arcathrake"
end

desc "Removes the rake task installer"
task :remove do
	exec "rm /usr/bin/arcathrake"
end

desc "Outputs the directory set in config"
task :directory do
	puts @arake.directory
end

import 'rake/master.rake'
require 'lib/arake.rb'	#ARake class
@arake=Arake.new(File.dirname(__FILE__))
