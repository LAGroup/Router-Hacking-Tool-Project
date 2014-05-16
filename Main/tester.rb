require './airmon_parser.rb'
require './monitoring_stopper.rb'
require './airodump_runner.rb'
require './airodump_parser.rb'
require './router_init.rb'
#monitoring_stopper(airmon_parser)

routers = Array.new
possibility = []
essid = []
poss_new = []

system("aireplay-ng -9 mon0 > inj_test.txt")

file = File.foreach("inj_test.txt") do |line| 

	if line =~ /\d\d\s+\d+\/30:\s+\d/
		possibility << line.split(/\d\d:\d\d:\d\d\s+/)[1].chomp
	end	

	if line =~ /- channel: /
		essid << line.split('\'')[1]
	end

end

for i in 0..possibility.length-1
 	if possibility[i].length < 25 
 		poss_new << possibility[i]
 		
 	end
end

for i in 0..essid.length - 1

	ap = Hash.new
	ap["essid"] = essid[i]
	ap["probes"] = poss_new[i]

	routers << ap
end
	
puts routers.length
puts routers

gets.chomp

airodump_parser()
ready_routers = router_init(routers)

ready_routers.each do |r| 
	puts "'#{r.essid}'"
	puts "'#{r.probes}'"
end


