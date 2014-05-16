require 'csv'
require './router.rb'
require './airodump_runner.rb'
#Parses airodump-ng's output (csv file)

def scan 

	airodump_runner(0)

	file = File.open("scan-01.csv")
	file.chmod( 0777 )

	out = File.new("scan_out.csv", "w")
	out.chmod( 0777 )
	
	File.foreach("scan-01.csv") { |line|
		if line =~ /Station MAC/
			break
		end
	  out.puts line unless line.chomp.empty? || line =~ /BSSID/
	}

	file.close
	out.close
end	

def	router_initialization ap_probes = Array.new
	
	routers = Array.new
	CSV.foreach("scan_out.csv") do |row|
		
		if row[13] != nil && row[13] =~ /\S/
			r = Router.new
			r.bssid = row[0]
			r.beacons = row[9]
			r.data = row[10]
			r.channel = row[3]
			r.power = row[8]
			r.privacy = row[5]
			r.essid = row[13]
			ap_probes.each do |ap|
				r.probes = ap["probes"] if r.essid == ap["essid"]
			end
			
			
			routers << r
		end
				
	end
	
	system("clear")
	
	return routers
end


