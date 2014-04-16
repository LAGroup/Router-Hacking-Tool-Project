# Returns the MAC address back to its default permanent value
def macfixer wlan, changed_mac

	if changed_mac	
		if system("sudo ifconfig #{wlan} down")
			if !system("sudo macchanger wlan0 -p > macfix.csv")
				puts "Failed to return to old MAC address!"
			elsif system("sudo ifconfig #{wlan} up")
				puts "\nMAC address was successfully returned back to normal!"
			end
		end
	end
	
end

