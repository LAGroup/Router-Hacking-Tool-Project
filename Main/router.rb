#Router class used to keep the information needed for every router

class Router

	attr_accessor :id, :bssid, :beacons, :data, :channel, :power, :privacy, :essid, :probes, :stations, :wps
	
	def initialize 
		
		@id = 0			#
		@bssid = ""		#
		@beacons = 0
		@data = 0
		@channel = 0	#
		@power = 0		#
		@privacy = ""	#
		@essid = ""		#
		@probes = ""	#
		@stations = Array.new	#
		@wps = ""
	
	end
	
	def print arg = "Nothing to print"
		puts arg
	end
	
end

