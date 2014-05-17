require 'csv'
require './airodump_runner.rb'
# Parses airodump-ng's focused output - csv file,  and makes 
# a new, easier to read csv

def airodump_focused_parser 

	file = File.open("focus-01.csv")
	file.chmod( 0666 )

	out = File.new("focus_out.csv", "w")
	out.chmod( 0666 )
	
	station = false
	channel_detect = false
	File.foreach("focus-01.csv") do |line|
	  if !(line.chomp.empty?) && (station || channel_detect)
	  	out.puts line 
	  end
	  channel_detect = false
	  if line =~ /BSSID/
	  	channel_detect = true
	  end
	  if line =~ /Station MAC/
	  	station = true
	  end
	  
	end

	file.close
	out.close	
end


