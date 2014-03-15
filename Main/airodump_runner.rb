require 'io/console'
#Runs airodump-ng as a subprocess and stops it after N seconds

def airodump_runner

	p = IO.popen("sudo airodump-ng mon0 -w scan --output-format csv")
	pid = p.pid
	n = 10
	sleep(n)
	Process.kill("INT", pid)

end

