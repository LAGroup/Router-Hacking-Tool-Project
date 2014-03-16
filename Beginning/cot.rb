#Command Output Taker

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
			#cmd[i] = cmd[i].split(/.\s[a-zA-Z]/)[0]
			#puts "[#{cmd[i]}]"
			
			wlans << cmd[i].split(/.\s[a-zA-Z]/)[0]
		end
		
		if cmd[i] =~ /mon[0-9]/
			#cmd[i] = cmd[i].split(/.\s[a-zA-Z]/)[0]
			#puts "[#{cmd[i]}]"
			
			mons << cmd[i].split(/.\s[a-zA-Z]/)[0]
			
			special << (cmd[i].split(/.\s[a-zA-Z]/)[0]).split(/mon/)[1]
		end
		
	end

	i += 1

end

puts "wlans:", "-----------", wlans, "-----------\n\n"
puts "mons:", "-----------", mons, "-----------\n\n"

#puts "special:", "-----------", special, "-----------\n\n"

