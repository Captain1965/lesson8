#encoding utf-8
#Добавляется определение типа вагона type cargo
# Добавить атрибут общего объема (задается при создании вагона)
# Добавить метод, которые "занимает объем" в вагоне (объем указывается в качестве параметра метода)
# Добавить метод, который возвращает занятый объем
# Добавить метод, который возвращает оставшийся (доступный) объем

require_relative 'wagon'

class WagonCargo < Wagon
	attr_reader :type

	def initialize(number,volume)
		@type = 'cargo'
		super
	end
end
