require './airmon_parser.rb'
require './monitoring_stopper.rb'

monitoring_stopper(airmon_parser)

class Abc

	attr_accessor :var

	def initialize
		@var = 0
	end
	
end

a = Abc.new
puts a.var
puts a.var = 5
a.var = 7
puts a.var



