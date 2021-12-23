#encoding utf-8
#Добавляется определение типа вагона type passeger

require_relative 'wagon'
class WagonPassenger < Wagon
	attr_accessor :number
	attr_reader :type
	def initialize
		@type = 'passenger'
	end
end
