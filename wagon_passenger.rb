#encoding utf-8
#Добавляется определение типа вагона type passeger
# Для пассажирских вагонов:
# Добавить атрибут общего кол-ва мест (задается при создании вагона)
# Добавить метод, который "занимает места" в вагоне (по одному за раз)
# Добавить метод, который возвращает кол-во занятых мест в вагоне
# Добавить метод, возвращающий кол-во свободных мест в вагоне.

require_relative 'wagon'
class WagonPassenger < Wagon
	attr_reader :type
	def initialize(number,volume)
		@type = 'passenger'
		super
	end

	def load_wagon(quantity = 1)
		quantity = 1
		super
	end
end

