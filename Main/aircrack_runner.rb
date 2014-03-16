# Runs aircrack-ng on the captured .ivs

def aircrack_runner
	system("clear")
	system("sudo aircrack-ng -w pass.lst replay-01.ivs")
end
