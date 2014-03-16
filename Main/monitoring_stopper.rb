#Monitoring Stopper

def monitoring_stopper interfaces = Array.new

	interfaces.each do |el|
		`sudo airmon-ng stop #{el}`
	end

end

