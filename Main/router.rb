#Router class used to keep the information needed for every router

class Router

	attr_reader :bssid, :beacons, :data, :channel, :power, :privacy, :essid, :id
	
	def initialize 
	
		@bssid = ""
		@beacons = 0
		@data = 0
		@channel = 0
		@power = 0
		@privacy = ""
		@essid = ""	
		@id = 0
	
	end
	
	def print arg = "Nothing to print"
		puts arg
	end
	
	def set_values bssid = "", beacons = 0, data = 0, channel = 0, power = 0, privacy = "", essid = ""
		@bssid = bssid
		@beacons = beacons
		@data = data
		@channel = channel
		@power = power
		@privacy = privacy
		@essid = essid
	end
	
	def set_id id = 0
		@id = id
	end
	
	
	
end

