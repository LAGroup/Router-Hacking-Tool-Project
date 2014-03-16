require 'csv'
require_relative 'station'
require_relative 'airodump_runner'
#Parses airodump-ng's focused output (csv file)

def airodump_focused_parser

	file = File.open("focus-01.csv")
	file.chmod( 0777 )

	out = File.new("focus_out.csv", "w")
	out.chmod( 0777 )
	
	station = false
	channel_detect = false
	File.foreach("focus-01.csv") do |line|
	  if !(line.chomp.empty?) && (station == true || channel_detect == true)
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
	
	# -------------------	
	
	channel = 0
	step = 1
	stations = Array.new
	CSV.foreach("focus_out.csv") do |row|
		
		if step == 1
			channel = row[3]
		else
			r = Station.new
			r.set_mac(row[0])
			r.set_bssid(row[5])
			r.set_channel(channel)
			stations << r
		end
		
		step += 1				
				
	end
	
	system("sudo rm -f focus-01.csv")
	system("sudo rm -f focus_out.csv")
	system("clear")
	
	return stations
end


