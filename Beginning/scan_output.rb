require 'csv'

bssid = Array.new
channel = Array.new
privacy = Array.new

def scan
	wlans = `sudo airmon-ng`
	mon = `sudo airmon-ng start wlan0` 
	`sudo airodump-ng --output-format csv -w scan mon0`
end

def file_treatment
	file = File.open("scan-01.csv")
	file.chmod( 0777 )

	out = File.new("Scan_out.csv", "w")
	out.chmod( 0777 )
	
	File.foreach("scan-01.csv") { |line|
	  out.puts line unless line.chomp.empty?
	}

	file.close
	out.close
end

def output_parse(bssid, channel, privacy)
	stop = false
	
	CSV.foreach("Scan_out.csv") do |row|
		row[0].each_line do |line|
			if(line != "Station MAC" && stop == false)	 
				 bssid << line
			else 
				stop = true
			end	 
		end

		row[3].each_line do |line|
			if(line != "Power" && stop == false)
				channel << line
			else
				stop = true
			end
		end

		row[5].each_line do |line|
			if(line != "BSSID" && stop == false)
				 privacy << line
			else
				stop = true
			end
		end
		row[8].to_s
		row[8].each_line do |line|
			p line
		end

	end
end

file_treatment

output_parse(bssid, channel, privacy)

puts bssid
puts channel
puts privacy	