require './router.rb'
require './airodump_runner.rb'
require './space_gen.rb'
#Focuses airodump-ng's scan on one specific router
 
 
def airodump_focus routers = Array.new
    
    puts "You can now choose which AP to attack."
    puts "We suggest to set your terminal to fullscreen."
    puts "Press Enter when ready..."
    gets.chomp
    
    begin
		system("clear")
		puts "Routers with higher data traffic, lower power or those who "
		puts "answered to more probe requests are easier to crack." 
		puts "\nChoose which router to attack:"
		puts "---------------------------------------"
	 	
		i = 1
		routers.each do |el|
		    if el.privacy =~ /WPA/ || el.privacy =~ /WEP/
		        el.id = i
		        n = 30; m = 12; sp = ""
		        n -= el.essid.length if el.essid.length > 0
		        m -= el.privacy.length
		        essid_ws = space_gen(n)
		        enc_ws = space_gen(m)
		        sp = " " if i < 10
		        (el.probes != "") ? (puts "#{el.id}) #{sp} #{el.essid}#{essid_ws}-->    Encryption: #{el.privacy}#{enc_ws}Power: #{el.power*(-1)}   Reaver-crackable: #{el.wps}   Probes answered: #{el.probes}") : (puts "#{el.id}) #{sp} #{el.essid}#{essid_ws}-->    Encryption: #{el.privacy}#{enc_ws}Power: #{el.power*(-1)}   Reaver-crackable: #{el.wps}")
		        i += 1
		    end
		end
	 
		puts "---------------------------------------"
		puts "Example: 5"
		printf "\n-> "
		
		input = gets.chomp
		input = input.to_i
		router = Router.new
		valid_input = false
 	
 		valid_input = true if input > 0 && input <= routers.length
 		
 		if valid_input
			routers.each do |el|
				if el.id == input
				    router = el
				    airodump_runner(1,el)
				end
			end
		else
		    puts "\nError: No such router id found!"
		    puts "Press Enter to continue..."
		    gets.chomp
        end
         
    end while !valid_input
     
    return router
 
end
