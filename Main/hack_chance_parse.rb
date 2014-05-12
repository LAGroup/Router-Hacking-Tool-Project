
possibility = []
essid = []
poss_new = []

file = File.foreach("test.txt") { |line| 
	
	if line =~ /.\d\/30:\s\s.\d/
			possibility << line	

		end	

	if line =~ /- channel: /
		essid << line.split('\'')[1]
	end

 }

 for i in 0..possibility.length-1
 	if possibility[i].length < 25 
 		poss_new << possibility[i][10..20]
 	end
 end

for i in 0..essid.length - 1
	puts essid[i]
	puts poss_new[i]
	puts 
end