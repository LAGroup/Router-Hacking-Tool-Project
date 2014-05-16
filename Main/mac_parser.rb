require 'csv'
# Parses the output of the macchanger command and retrns the new MAC

def mac_parser

	CSV.foreach("mac.csv") do |row|
		line = row[0].split(/MAC:/)[0]
		if line =~ /New/
			new_mac = row[0].split(/MAC:/)[1]
			new_mac = (new_mac.split(' ')[0]).chomp
			return new_mac
		end
	end
	
end

