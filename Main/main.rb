require 'csv'
require_relative 'airmon_parser'
require_relative 'monitoring_starter'
require_relative 'airodump_parser'
require_relative 'airodump_focus'
require_relative 'airodump_focused_parser'
require_relative 'wpa_handler'
require_relative 'cleaner'
require_relative 'monitoring_stopper'
require_relative 'router'
require_relative 'macchanger'
require_relative 'wep_handler'
#Main file

if system("cls")
	abort("RHT can run only on Linux BackTrack. Sorry, mate.")
end

cleaner()
# Deletes trash files, that were left from previous runs

monitoring_stopper(airmon_parser)
# ^ stops all mons and wlans, ensuring mon0 will be free

data = macchanger(monitoring_starter(airmon_parser))
# Offers the user to temporary change his MAC address
wlan = data[0]
changed_mac = data[1]
puts "\nMonitoring mode successfully started"

router = airodump_focus(airodump_parser)
# Focuses airodump on the chosen router; returns encryption
 
if router.privacy =~ /WEP/
    wep_handler(router)
else
    wpa_handler(airodump_focused_parser)
    # Runs aireplay on one of the selected router's stations,
    # also runs aircrack on the ivs file
end

#aircrack_runner()
# Runs aircrack on the ivs file

#macfixer(wlan, changed_mac)
# Return the old MAC Address

monitoring_stopper(airmon_parser)
# Stops all mons and wlans

cleaner()
# Deletes all iv-s, txt-s, csv-s, cap-s, etc that are left behind by the program

puts "\nMonitoring mode successfully stopped"
puts "Bye bye :)"

