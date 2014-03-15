#Parses airmon-ng's output

def airmon_parser 

	cmd = Array.new

	out = `sudo airmon-ng`
	out.each_line do |el|
		cmd << el
	end

	wlans = Array.new
	mons = Array.new
	i = 0

	while i < cmd.length

		if i >= 4 
			if cmd[i] =~ /wlan[0-9]/
				wlans << cmd[i].split(/\s\s[a-zA-Z]/)[0]
			end
		
			if cmd[i] =~ /mon[0-9]/
				mons << cmd[i].split(/\s\s[a-zA-Z]/)[0]
			end
		
		end

		i += 1

	end

	interfaces = Array.new
	interfaces = [wlans, mons]
	
	return interfaces.flatten!
	
end
