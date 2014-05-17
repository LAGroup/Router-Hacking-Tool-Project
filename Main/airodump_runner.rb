require 'timeout'
#Runs airodump-ng as a subprocess and stops it after N seconds

def airodump_runner arg = 0, r = Router.new

	if arg == 0 
		
		pid = Process.spawn("sudo airodump-ng mon0 -w scan --output-format csv")
		begin
			Timeout.timeout(16) do
				Process.wait(pid)
			end
		rescue Timeout::Error
			system("clear")
			Process.kill('TERM', pid)
		end
		
	elsif arg == 1
	
		pid = Process.spawn("sudo airodump-ng -i mon0 --bssid #{r.bssid} -c #{r.channel} -w focus --output-format csv --ivs")
		begin
			Timeout.timeout(16) do
				Process.wait(pid)
			end
		rescue Timeout::Error
			system("clear")
			Process.kill('TERM', pid)
		end
			
		return r
	end
	
	
end

