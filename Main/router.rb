#Router class used to keep the information needed for every router

class Router

attr_accessor :bssid, :beacons, :data, :channel, :power, :privacy, :essid, :id
	
	def initialize 
	
		self.bssid = ""
		self.beacons = 0
		self.data = 0
		self.channel = 0
		self.power = 0
		self.privacy = ""
		self.essid = ""	
		self.id = 0
	
	end
	
	def get arg = ""
		case arg
		
		when "bssid"
			return self.bssid
		when "beacons"
			return self.beacons
		when "data"
			return self.data
		when "channel"
			return self.channel
		when "power"
			return self.power
		when "privacy"
			return self.privacy
		when "essid"
			return self.essid
		when "id"
			return self.id
		else
			return nil
		end
	end
	
	def print arg = "Nothing to print"
		puts arg
	end
	
	def set_values bssid = "", beacons = 0, data = 0, channel = 0, power = 0, privacy = "", essid = ""
		self.bssid = bssid
		self.beacons = beacons
		self.data = data
		self.channel = channel
		self.power = power
		self.privacy = privacy
		self.essid = essid
	end
	
	def set_id id = 0
		self.id = id
	end
	
	
	
end

