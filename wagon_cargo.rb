#encoding utf-8
#Добавляется определение типа вагона type cargo
require_relative 'wagon'
require_relative 'train'
require_relative 'wagon'
require_relative 'wagon_passenger'
class WagonCargo < Wagon
	attr_reader :type
	def initialize
		@type = 'cargo'
	end
end