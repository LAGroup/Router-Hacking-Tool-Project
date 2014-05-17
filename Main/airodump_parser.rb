require 'csv'
require './airodump_runner.rb'
# Parses airodump-ng's output - csv file,  and makes 
# a new, easier to read csv

def airodump_parser 

	airodump_runner(0)

	file = File.open("scan-01.csv")
	file.chmod( 0666 )

	out = File.new("scan_out.csv", "w")
	out.chmod( 0666 )
	
	File.foreach("scan-01.csv") { |line|
		if line =~ /Station MAC/
			break
		end
	  out.puts line unless line.chomp.empty? || line =~ /BSSID/
	}

	file.close
	out.close
end	


