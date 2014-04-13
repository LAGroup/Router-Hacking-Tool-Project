#Station class used to keep the information needed for every station

class Station

attr_reader :stmac, :bssid, :channel
	
	def initialize 
		stmac = ""
		bssid = ""
		channel = 0
	end
	
	def set_mac mac = ""
		@stmac = mac
	end
	
	def set_bssid bssid = ""
		@bssid = bssid
	end
	
	def set_channel channel = 0
		@channel = channel
	end
	
	def print arg = "Nothing to print"
		puts arg
	end

end


