#Monitoring Stopper

def monitoring_stopper interfaces = Array.new, disp_mes = 0

	if interfaces.is_a? Array
		interfaces.each do |el|
			stop(el)
		end
	elsif interfaces.is_a? String
		stop(interfaces)	
	end
	
	puts "\nMonitoring mode successfully stopped." if disp_mes == 1
end


def stop interface

	if !system("sudo airmon-ng stop #{interface}")
		system("clear")
		abort("\nMonitoring mode could not be stopped for #{interface}!")
	else
		system("clear")
	end

end
