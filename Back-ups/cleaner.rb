# Deletes the unnecessary files

def cleaner
	if !system("sudo rm -f *.ivs *.txt *.csv")
		abort("Error deleting trash files!")
	end
end
