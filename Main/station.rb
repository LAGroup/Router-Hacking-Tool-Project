#Station class used to keep the information needed for every station

class Station

attr_accessor :stmac, :bssid, :channel
	
	def initialize 
		stmac = ""
		bssid = ""
		channel = 0
	end
	
	def get arg = ""
		case arg
		
		when "bssid"
			return self.bssid
		when "stmac"
			return self.stmac
		when "channel"
			return self.channel
		else
			return nil
		end
	end
	
	def set_mac mac = ""
		self.stmac = mac
	end
	
	def set_bssid bssid = ""
		self.bssid = bssid
	end
	
	def set_channel channel = 0
		self.channel = channel
	end
	
	def print arg = "Nothing to print"
		puts arg
	end

end


