require 'csv'
require './router.rb'
# Initializes a router object for every AP found by airodump 

def	router_init wash_list = Array.new, ap_probes = Array.new
	
	nil_wash = false
	nil_probes = false
	
	if wash_list.nil?
		nil_wash = true
		wash_list = Array.new
	end
	
	if ap_probes.nil?
		nil_probes = true
		ap_probes = Array.new 
	end
	
	routers = Array.new
	CSV.foreach("scan_out.csv") do |row|
		
		if row[13] != nil && row[13] =~ /\S/ && row[13].length > 0
			r = Router.new
			r.bssid = row[0]
			r.beacons = row[9].to_i
			r.data = row[10].to_i
			r.channel = row[3].to_i
			r.power = row[8].to_i
			r.privacy = row[5]
			essid = String.new
			for i in 0..row[13].length - 1
				essid << row[13][i] if i > 0
			end
			r.essid = essid
			
			if !nil_probes
				ap_probes.each do |ap|
					r.probes = ap["probes"] if r.essid == ap["essid"]
				end		
			end
			
			if !nil_wash
				wash_list.each do |ap|
					if ap.wps == "No"
						ap.wps = "Yes"
					elsif ap.wps == "Yes"
						ap.wps = "No"
					end
					r.wps = ap.wps
				end
			end
			
			routers << r
		end
				
	end
	
	system("clear")
	
	return routers
end


