require './cleaner.rb'
require './monitoring_stopper.rb'
# Stops all monitoring modes and deletes trash files

def stop_n_clean stop_disp_mes = 0, clean_disp_mes = 0

	monitoring_stopper(airmon_parser, stop_disp_mes)
	cleaner(clean_disp_mes)

end

