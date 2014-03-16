#Runs airodump-ng as a subprocess and stops it after N seconds

<<<<<<< HEAD
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
	
	
=======
def airodump_runner

	p = IO.popen("sudo airodump-ng mon0 -w scan --output-format csv")
	pid = p.pid
	n = 10
	sleep(n)
	Process.kill("INT", pid)

>>>>>>> c48210011c8ecf6b8ab7a51ac00056be02099a8c
end

