require 'csv'
#Parses the output of aireplay
def aireplay_parser

	CSV.foreach("replay_output.csv") do |row|
		
		puts row[0]
	
	end



end
aireplay_parser
