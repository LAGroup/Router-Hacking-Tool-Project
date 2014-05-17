#Station class used to keep the information needed for every station

class Station

attr_accessor :stmac, :bssid, :channel
	
	def initialize 
		stmac = ""
		bssid = ""
		channel = 0
	end

end


