#Monitoring Stopper

def monitoring_stopper interfaces = Array.new, disp_mes = 0

	interfaces.each do |el|
		if !system("sudo airmon-ng stop #{el}")
			abort("\nMonitoring mode could not be stopped for #{el}!")
		else
			system("clear")
			if disp_mes == 1
				puts "\nMonitoring mode successfully stopped"
			end
		end
	end

end

