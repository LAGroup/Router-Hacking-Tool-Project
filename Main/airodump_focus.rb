require_relative 'router'
<<<<<<< HEAD
require_relative 'airodump_runner'
#Focuses airodump-ng's scan on one specific router


def airodump_focus routers = Array.new
=======
require_relative 'space_generator'
#Focuses airodump-ng's scan on one specific router

def airodump_focus routers = Array.new

	space_generator(15)
>>>>>>> c48210011c8ecf6b8ab7a51ac00056be02099a8c
	
	puts "\nChoose which router to crack:"
	puts "---------------------------"

	i = 1
	routers.each do |el|
<<<<<<< HEAD
		if el.get("privacy") =~ /WPA/
			el.set_id(i)
			puts "#{el.get("id")}) #{el.get("essid")}   ->   #{el.get("privacy")}"
=======
		if el.privacy =~ /WPA2/
			el.id = i
			puts "#{el.id}) #{el.essid}   ->   #{el.privacy}"
>>>>>>> c48210011c8ecf6b8ab7a51ac00056be02099a8c
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
<<<<<<< HEAD
			if el.get("id").to_i == input
				airodump_runner(1,el)
=======
			if el.id.to_i == input
				#`sudo airodump-ng -i mon0 --bssid #{el.bssid} -c #{el.channel} -w focus --output-format csv --ivs`
>>>>>>> c48210011c8ecf6b8ab7a51ac00056be02099a8c
			end
		end
	else
		puts "Error: No such router id found!"
	end

end

