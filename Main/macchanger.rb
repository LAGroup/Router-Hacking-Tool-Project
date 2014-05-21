# Changes the MAC address temporary

def macchanger wlan = "wlan0"
	
	changed_mac = false

	puts "Would you like to use a macchanger? (y/n)"
	input = gets.chomp
	if input == 'y' || input == 'Y'
		puts
		if system("sudo ifconfig #{wlan} down")
			if !system("sudo macchanger wlan0 -a")
				puts "Failed to change MAC address!"
			else
				changed_mac = true
				if system("sudo ifconfig #{wlan} up")
					puts "MAC address was successfully changed!"
					puts "Press Enter to continue..."
					gets.chomp
				end
			end
			
		end
	end	

	return wlan
end

