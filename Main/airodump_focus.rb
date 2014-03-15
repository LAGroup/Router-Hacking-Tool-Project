require_relative 'router'
require_relative 'space_generator'
#Focuses airodump-ng's scan on one specific router

def airodump_focus routers = Array.new

	space_generator(15)
	
	puts "\nChoose which router to crack:"
	puts "---------------------------"

	i = 1
	routers.each do |el|
		if el.privacy =~ /WPA2/
			el.id = i
			puts "#{el.id}) #{el.essid}   ->   #{el.privacy}"
			i += 1
		end
	end

	puts "---------------------------"
	puts "Example: 5"
	printf "\n-> "
	
	input = gets.chomp
	input = input.to_i

	if input > 0 && input < routers.length
		routers.each do |el|
			if el.id.to_i == input
				#`sudo airodump-ng -i mon0 --bssid #{el.bssid} -c #{el.channel} -w focus --output-format csv --ivs`
			end
		end
	else
		puts "Error: No such router id found!"
	end

end

