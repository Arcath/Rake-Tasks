#!/usr/bin/env ruby
installdir=File.readlink(File.dirname(__FILE__) + "/arcathrake").gsub("/bin/setup.rb","")
require "#{installdir}/lib/arake"	#ARake

@arake=Arake.new

if ARGV[0] == "setup" then
	puts "Creating symlink"
	system "ln -s #{@arake.directory}/rake ./ArcathRake"
	@arake.gitignore
elsif ARGV[0] == "remove" then
	puts "Removing"
	system "rm ./ArcathRake"
else
	puts "Please state weather you want to \"setup\" or \"remove\""
end
