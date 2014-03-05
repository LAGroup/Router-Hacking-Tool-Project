#Monitoring Stopper

cmd = Array.new

out = `sudo airmon-ng`

out.each_line do |el|
	cmd << el
end

wlans = Array.new
mons = Array.new
i = 0
special = Array.new

while i < cmd.length

	if i >= 4 
		if cmd[i] =~ /wlan[0-9]/
			
			wlans << cmd[i].split(/.\s[a-zA-Z]/)[0]
		end
		
		if cmd[i] =~ /mon[0-9]/
			
			mons << cmd[i].split(/.\s[a-zA-Z]/)[0]
			
			#special << (cmd[i].split(/.\s[a-zA-Z]/)[0]).split(/mon/)[1]
			# ^ Takes the number of the mon
		end
		
	end

	i += 1

end

mons.each do |el|
	`sudo airmon-ng stop #{el}`
end

wlans.each do |el| 
	`sudo airmon-ng stop #{el}`
end

puts "Successfully closed \n\n"

