require 'csv'
require './stop_n_clean.rb'
require './airmon_parser.rb'
require './monitoring_starter.rb'
require './macchanger.rb'
require './airodump_parser.rb'
require './airodump_focus.rb'
require './router.rb'
require './airodump_focused_parser.rb'
require './wpa_handler.rb'
require './wep_handler.rb'

#Main file
puts "RHT v1.2.4"
puts 

if system("cls")
	abort("RHT can run only on Linux BackTrack. Sorry, mate.")
end

stop_n_clean(0)
# Stops all mons and wlans, ensuring mon0 will be free and
# deletes trash files, that were left from previous runs

data = macchanger(monitoring_starter(airmon_parser))
# Offers the user to temporary change his MAC address
wlan = data[0]
changed_mac = data[1]

router = airodump_focus(airodump_parser)
# Focuses airodump on the chosen router; returns encryption
 
if router.privacy =~ /WEP/
    wep_handler(router)
else
    wpa_handler(airodump_focused_parser)
    # Runs aireplay on one of the selected router's stations,
    # also runs aircrack on the ivs file
end

stop_n_clean(1)

puts "Bye bye :)"

