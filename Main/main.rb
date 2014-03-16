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
#Main file

monitoring_stopper(airmon_parser)
# ^ stops all mons and wlans, ensuring mon0 will be free

monitoring_starter(airmon_parser)
# Starts mon0 for the chosen wlan
puts "\nMonitoring mode successfully started"

airodump_focus(airodump_parser)
# Focuses airodump on the chosen router

aireplay_runner(airodump_focused_parser)
# Runs aireplay on one of the selected router's stations

aircrack_runner
# Runs aircrack on the ivs file

cleaner
# Deletes the ivs

monitoring_stopper(airmon_parser)
# Stops all mons and wlans
puts "\nMonitoring mode successfully stopped"
puts "Bye bye :)"

