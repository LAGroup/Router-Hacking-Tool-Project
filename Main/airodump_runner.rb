#Runs airodump-ng as a subprocess and stops it after N seconds

def airodump_runner arg = 0, r = Router.new

	if arg == 0 
		p = IO.popen("sudo airodump-ng mon0 -w scan --output-format csv")
		pid = p.pid
		n = 15
		sleep(n)
		Process.kill("INT", pid)
	elsif arg == 1
		p = IO.popen("sudo airodump-ng -i mon0 --bssid #{r.get("bssid")} -c #{r.get("channel")} -w focus --output-format csv --ivs")
		pid = p.pid
		n = 20
		sleep(n)
		Process.kill("INT", pid)
		
		return r
	end
	
	
end

