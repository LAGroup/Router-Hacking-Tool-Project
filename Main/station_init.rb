require 'csv'
require './station.rb'
# Initializes a Station object for every station found by 
# the focused airodump


def station_init router = Router.new

	channel = 0
	step = 1
	stations = Array.new
	CSV.foreach("focus_out.csv") do |row|
		
		if step == 1
			channel = row[3]
		else
			s = Station.new
			s.stmac = row[0]
			s.bssid = row[5]
			s.channel = channel
			router.stations << s
		end
		
		step += 1				
				
	end
	
	system("clear")
	
	return router
end
