# Runs a very simple injection test to see if 
# the wireless card supports injection

def supports_injection?

	inj_works = false
	
	if !system("aireplay-ng -9 mon0 > inj_test.txt")
		system("clear")
		puts "Sorry, either your wireless is disabled or"
		puts "your wireless card does not support injection."
		puts "This makes cracking impossible."
		puts
	end
	
	file = File.foreach("inj_test.txt") do |line| 
	
		if line =~ /Injection is working!/
			inj_works = true
		end
		
	end
	
	return inj_works
end
