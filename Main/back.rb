
		row[13].each_line do |line|
			if line != nil || line =~ /./
				r = Router.new
				r.essid = line
				
				row[0].each_line do |line|	 
					r.bssid = line
				end

				row[3].each_line do |line|
					r.channel = line
				end

				row[5].each_line do |line|
					r.privacy = line
				end
		
				row[8].each_line do |line|
					r.power = line
				end
		
				row[9].each_line do |line|
					r.beacons = line
				end
		
				row[10].each_line do |line|
					r.data = line
				end
		
				routers << r
			end
		end
