require_relative 'mac_parser'
# Changes the MAC address temporary
def macchanger wlan = "wlan0"
	
	new_mac = 0
	changed_mac = false
	
	puts "Would you like to use a macchanger? (y/n)"
	input = gets.chomp
	if input == 'y' || input == 'Y'
		if system("sudo ifconfig #{wlan} down")
			if !system("sudo macchanger wlan0 -a > mac.csv")
				puts "Failed to change MAC address!"
			else
				new_mac = mac_parser
				changed_mac = true
			end
			if system("sudo ifconfig #{wlan} up")
				puts "MAC address was successfully changed!"
				system("read -p 'Press any key to continue...'")
			end
		end
	end	

	return [wlan, changed_mac]

end

