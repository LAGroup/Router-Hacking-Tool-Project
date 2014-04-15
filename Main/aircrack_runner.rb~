require_relative 'monitoring_stopper'
require_relative 'cleaner'
# Runs aircrack-ng on the captured .ivs

def aircrack_runner
	system("clear")
	if !system("sudo aircrack-ng -w pass.lst replay-01.ivs")
		monitoring_stopper()
		cleaner()
		abort("\nCracker fail!")
	end
end
