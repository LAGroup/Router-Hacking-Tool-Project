require 'csv'
require_relative 'airmon_parser'
require_relative 'monitoring_starter'
require_relative 'airodump_parser'
require_relative 'airodump_focus'
require_relative 'airodump_focused_parser'
require_relative 'aireplay_runner'
require_relative 'aircrack_runner'
require_relative 'cleaner'
require_relative 'monitoring_stopper'
require_relative 'router'
require_relative 'macchanger'
#require_relative 'macfixer'
require_relative 'mac_parser'
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

airodump_focus(airodump_parser)
# Focuses airodump on the chosen router

aireplay_runner(airodump_focused_parser)
# Runs aireplay on one of the selected router's stations,
# also runs aircrack on the ivs file

#aircrack_runner()
# Runs aircrack on the ivs file

#macfixer(wlan, changed_mac)
# Return the old MAC Address

monitoring_stopper(airmon_parser)
# Stops all mons and wlans

cleaner()
# Deletes all iv-s, txt-s, csv-s, that are left behind by the program

puts "\nMonitoring mode successfully stopped"
puts "Bye bye :)"

