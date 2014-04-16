#Monitoring Stopper

def monitoring_stopper interfaces = Array.new

	interfaces.each do |el|
		if !system("sudo airmon-ng stop #{el} > mon_stopper.txt")
				abort("\nMonitoring mode could not be stopped for #{el}!")
		end
	end

end

