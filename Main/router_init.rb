require 'csv'
require './router.rb'
# Initializes a router object for every AP found by airodump 

def	router_initialization ap_probes = Array.new
	
	routers = Array.new
	CSV.foreach("scan_out.csv") do |row|
		
		if row[13] != nil && row[13] =~ /\S/
			r = Router.new
			r.bssid = row[0]
			r.beacons = row[9].to_i
			r.data = row[10].to_i
			r.channel = row[3].to_i
			r.power = row[8].to_i
			r.privacy = row[5]
			r.essid = row[13]
			
			if ap_probes.length > 0
				ap_probes.each do |ap|
					r.probes = ap["probes"] if r.essid == ap["essid"]
				end		
			end
			
			routers << r
		end
				
	end
	
	system("clear")
	
	return routers
end


