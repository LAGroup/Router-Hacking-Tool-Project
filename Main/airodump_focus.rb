require './router.rb'
require './airodump_runner.rb'
#Focuses airodump-ng's scan on one specific router
 
 
def airodump_focus routers = Array.new
    
    puts "You can now choose which AP to attack."
    puts "We suggest to set your terminal to fullscreen."
    puts "Press Enter when ready..."
    gets.chomp
	puts "Routers with higher data traffic, lower power or those who "
	puts "answered to all probe requests are easier to crack." 
    puts "\nChoose which router to attack:"
    puts "---------------------------"
 
    i = 1
    routers.each do |el|
        if el.privacy =~ /WPA/ || el.privacy =~ /WEP/
            el.id = i
            puts "#{el.id}) #{el.essid}   ->   #{el.privacy};  Power: #{el.power*(-1)};  Probe requests answered: #{el.probes}"
            i += 1
        end
    end
 
    puts "---------------------------"
    puts "Example: 5"
    printf "\n-> "
     
    input = gets.chomp
    input = input.to_i
    router = Router.new
 
    if input > 0 && input <= routers.length
        routers.each do |el|
            if el.id == input
                router = el
                airodump_runner(1,el)
            end
        end
    else
        abort("Error: No such router id found!")
    end
     
    return router
 
end
