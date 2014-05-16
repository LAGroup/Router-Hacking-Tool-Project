# Deletes the unnecessary files

def cleaner disp_mes = 0
	if !system("sudo rm -f *.ivs *.txt *.csv *.cap *.kismet *.netxml")
		system("clear")
		abort("Error deleting trash files!")
	else
		if disp_mes == 1
			puts "Unnecessary files successfully deleted." 
		end
	end
end
