require 'timeout'
require 'csv'
require './router.rb'
# Parses wash's output - txt file, and  
# creates an easier to use csv file

def wash_parser

	pid = Process.spawn("sudo wash -i mon0 > wash.txt")
	begin
		Timeout.timeout(16) do
			Process.wait(pid)
		end
	rescue Timeout::Error
		system("clear")
		Process.detach(pid)
		Process.kill(:TERM, pid)
	end

	new = File.new("wash.csv","w")
	
	File.foreach("wash.txt") do |line|
	
		if line =~ /(\d|\w)+:(\d|\w)+:(\d|\w)+:(\d|\w)+:(\d|\w)+:(\d|\w)+/
			line = line.gsub(/\s\s+/, ",")
			new.puts line
		end
		
	end
	
	new.close
	
	routers = Array.new
	CSV.foreach("wash.csv") do |row|
		r = Router.new
		r.bssid = row[0]
		r.essid = row[5]
		r.channel = row[1]
		r.wps = row[4]
	
		routers << r
	end
	
	return routers
end

