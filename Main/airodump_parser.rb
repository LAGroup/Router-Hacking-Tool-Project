require 'csv'
require_relative 'router'
require_relative 'airodump_runner'
#Parses airodump-ng's output (csv file)

def airodump_parser

<<<<<<< HEAD
	airodump_runner(0)
=======
	airodump_runner
>>>>>>> c48210011c8ecf6b8ab7a51ac00056be02099a8c

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
	
	# -------------------	
		
	routers = Array.new
<<<<<<< HEAD
	CSV.foreach("scan_out.csv") do |row|
		
		if row[13] != nil || row[13] =~ /./ 
			r = Router.new
			r.set_values(row[0], row[9], row[10], row[3], row[8], row[5], row[13])
		
			routers << r
		end
				
	end
	
	system("sudo rm -f scan-01.csv")
	system("sudo rm -f scan_out.csv")
	system("clear")
=======
		
	CSV.foreach("scan_out.csv") do |row|
		
		#puts row[0]
		
		row[13].each_line do |line|
			if line != nil || line =~ /./
				@r = Router.new
				@r.essid = line
			end
		end
		
		row[0].each_line do |line|	 
			@r.bssid = line
		end

		row[3].each_line do |line|
			@r.channel = line
		end

		row[5].each_line do |line|
			@r.privacy = line
		end
		
		row[8].each_line do |line|
			@r.power = line
		end
		
		row[9].each_line do |line|
			@r.beacons = line
		end
		
		row[10].each_line do |line|
			@r.data = line
		end
		
		routers << @r
				
	end
	
	`sudo rm -f scan-01.csv`
	`sudo rm -f scan_out.csv`
	`clear`
>>>>>>> c48210011c8ecf6b8ab7a51ac00056be02099a8c
	
	return routers
end


