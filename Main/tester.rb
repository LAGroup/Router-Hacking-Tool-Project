require './airmon_parser.rb'
require './monitoring_stopper.rb'
require './airodump_runner.rb'
require './airodump_parser.rb'
require './router_init.rb'
monitoring_stopper(airmon_parser)

#puts "F-A-I-L" if !system("firefox out.html")
if 1 == 0 
	a=3
end
puts "Great!" if a.nil?
a = Array.new
puts "Greater!" if a.nil?
