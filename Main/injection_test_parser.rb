# Test injection, sends probe requests to all visible APs

def injection_test

	routers = Array.new
	possibility = []
	essid = []
	poss_new = []

	file = File.foreach("inj_test.txt") { |line| 
	
		if line =~ /.\d\/30:\s.\d/
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
		
		ap = Hash.new
		ap["essid"] = essid[i]
		ap["poss"] = poss_new[i]
		
		routers << ap
	end
		
	return routers

end

