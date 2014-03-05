cmd = Array.new

cmd[0] = `sudo airmon-ng`
cmd[1] = `sudo airmon-ng start wlan0`

puts "Successfully opened \n\n"

#cmd[2] = `sudo airodump-ng mon0`

#BIG - C8:3A:35:31:8E:20
bssid = "C8:3A:35:31:8E:20"

#linksys (mine) - 

