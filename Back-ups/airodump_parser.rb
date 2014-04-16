require 'csv'
require_relative 'router'
require_relative 'airodump_runner'
#Parses airodump-ng's output (csv file)

def airodump_parser

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
	
	# -------------------	
		
	routers = Array.new
	CSV.foreach("scan_out.csv") do |row|
		
		if row[13] != nil || row[13] =~ /./ 
			r = Router.new
			r.set_values(row[0], row[9], row[10], row[3], row[8], row[5], row[13])
		
			routers << r
		end
				
	end
	
	system("clear")
	
	return routers
end


