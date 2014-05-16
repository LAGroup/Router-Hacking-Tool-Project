require 'csv'
require './stop_n_clean.rb'
require './airmon_parser.rb'
require './monitoring_starter.rb'
require './macchanger.rb'
require './inj_support.rb'
require './injection_test_parser.rb'
require './airodump_parser.rb'
require './router_init.rb'
require './airodump_focus.rb'
require './router.rb'
require './airodump_focused_parser.rb'
require './wpa_handler.rb'
require './wep_handler.rb'

#require './station_detector.rb'

#Main file
system("clear")
puts "RHT v1.2.4"
puts 
puts "Please make sure that your wireless is enabled!"
puts "Press Enter to continue..."
gets.chomp

if system("cls")
	abort("RHT can run only on Linux BackTrack or Kali. Sorry, mate.")
end

stop_n_clean(0,0)
# Stops all mons and wlans, ensuring mon0 will be free and
# deletes trash files, that were left from previous runs

interface = macchanger(monitoring_starter(airmon_parser, 1))
# Offers the user to temporary change his MAC address

system("clear")
puts "RHT is checking if your wireless card supports injection..."
puts

if supports_injection?
	puts
	puts "Your card supports injection!"
	puts "You can now start a 'Probe Request' test which will help later"
	puts "by telling you which routers are not a good attack target."
	puts "This can be determined by their responce to this test."
	puts "\nNote: Have in mind that this test takes a couple of minutes."
	
	puts "\nDo you want to run the test? (y/n)"
	input = gets.chomp
	if input == 'y' || input == 'Y'
	
		puts "RHT will now send probe requests to all visible APs and"
		puts "will bring up a list for you to chose which router to attack."
		puts "\nPress Enter to continue..."
		gets.chomp
	
		ap_probes = injection_test_parser(interface)
	end
	
	airodump_parser()
	
	router = airodump_focus(router_initialization(ap_probes))
	# Focuses airodump on the chosen router; returns encryption
	 
	if router.privacy =~ /WEP/
		wep_handler(router)
	else
		wpa_handler(airodump_focused_parser)
		# Runs aireplay on one of the selected router's stations,
		# also runs aircrack on the ivs file
	end
else 
	puts
	puts "Press Enter to continue..."
	gets.chomp
end

stop_n_clean(1,1)
puts "\nThank you for using RHT!"
puts "Bye bye :)"

