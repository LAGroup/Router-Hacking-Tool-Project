#Router class used to keep the information needed for every router

class Router

attr_accessor :bssid, :beacons, :data, :channel, :power, :privacy, :essid, :id
	
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

end


