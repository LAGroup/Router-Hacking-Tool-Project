#Monitoring Starter
#Starts monitoring mode for the chosen wlan

def monitoring_starter interfaces = Array.new


	if interfaces.length == 1
	
		if !system("sudo airmon-ng start #{interfaces[0]}")
				abort("Couldn't start monitoring mode for #{interfaces[0]}!")
		else
			system("clear")
			puts "\nMonitoring mode successfully started"
			return interfaces[0]
		end
		
	else
	
		puts "\nChoose which wireless-lan card to use:"
		puts "-------------------------"
	
		interfaces.each do |el|
			if el =~ /wlan[0-9]/
				puts el
			end
		end
	
		puts "-------------------------"
		puts "Example: wlan0"
		printf "\n-> "
	
		input = gets.chomp
		puts
		if input =~ /wlan[0-9]/
			if !system("sudo airmon-ng start #{input}")
				abort("Couldn't start monitoring mode for #{input}!")
			else
				system("clear")
				puts "\nMonitoring mode successfully started"
			end
			return input
		else
			abort("Error: No such wlan found!")
		end
		
	end
	
end
