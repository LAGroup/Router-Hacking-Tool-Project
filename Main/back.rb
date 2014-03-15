require 'csv'
require_relative 'router'

def airodump_parser

	file = File.open("scan-01.csv")
	file.chmod( 0777 )

	out = File.new("scan_out.csv", "w")
	out.chmod( 0777 )
	
	File.foreach("scan-01.csv") { |line|
		if line =~ /Station MAC/
			break
		end
	  out.puts line unless line.chomp.empty?
	}

	file.close
	out.close
	
	# -------------------	
		
	bssid = Array.new
	beacons = Array.new
	data = Array.new
	channel = Array.new
	privacy = Array.new
	power = Array.new
	essid = Array.new
	
		
	CSV.foreach("scan_out.csv") do |row|
		
		#puts row[0]
		
		row[13].each_line do |line|
			if line != nil
				essid << line
			else
				row += 1
			end
		end
		
		row[0].each_line do |line|	 
			bssid << line
		end

		row[3].each_line do |line|
			channel << line
		end

		row[5].each_line do |line|
			privacy << line
		end
		
		row[8].each_line do |line|
			power << line
		end
		
		row[9].each_line do |line|
			beacons << line
		end
		
		row[10].each_line do |line|
			data << line
		end
		
	end
	
	`sudo rm -f scan-01.csv`
	`sudo rm -f scan_out.csv`
end

airodump_parser

