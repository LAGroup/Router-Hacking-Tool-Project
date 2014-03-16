#Monitoring Starter

def monitoring_starter interfaces = Array.new

	puts "RHT v1.0.0"

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
		`sudo airmon-ng start #{input}`
	else
		puts "Error: No such wlan found!"
	end

end
