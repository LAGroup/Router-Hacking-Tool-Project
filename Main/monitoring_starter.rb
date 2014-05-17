#Monitoring Starter
#Starts monitoring mode for the chosen wlan

def monitoring_starter interfaces = Array.new, disp_mes = 0

	if interfaces.length == 1
		puts "\nOnly one wireless card was found.\nStarting monitoring mode..."
		sleep(1)
		
		return start(interfaces[0], disp_mes)
		
	else
		begin
			system("clear")
			puts "\nMore than one wireless cards were found."
			puts "\nChoose which one to use:"
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
			valid_input = false
			puts
			
			valid_input = true if input =~ /wlan[0-9]/
			
			if valid_input
				return start(input,1)
			end

			puts "Error: No such wlan found!"
			puts "Press Enter to continue..."
			gets.chomp

		end while !valid_input
	end
	
end


def start interface, disp_mes = 0, in_file = 0, channel = -1

	if channel > -1
		if in_file == 1
			if !system("sudo airmon-ng start #{interface} #{channel} > mon_start.txt")
				system("clear")	
				abort("Couldn't start monitoring mode for #{interface}!")
			else
				system("clear")
				puts "\nMonitoring mode successfully started." if disp_mes == 1
				return interface
			end
		else
			if !system("sudo airmon-ng start #{interface} #{channel}")
				system("clear")	
				abort("Couldn't start monitoring mode for #{interface}!")
			else
				system("clear")
				puts "\nMonitoring mode successfully started." if disp_mes == 1
				return interface
			end
		end
	else
		if in_file == 1
			if !system("sudo airmon-ng start #{interface} > mon_start.txt")
				system("clear")
				abort("Couldn't start monitoring mode for #{interface}!")
			else
				system("clear")
				puts "\nMonitoring mode successfully started." if disp_mes == 1
				return interface
			end
		else
			if !system("sudo airmon-ng start #{interface}")
				system("clear")
				abort("Couldn't start monitoring mode for #{interface}!")
			else
				system("clear")
				puts "\nMonitoring mode successfully started." if disp_mes == 1
				return interface
			end
		end
	end
	
end

