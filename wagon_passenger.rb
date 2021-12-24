#encoding utf-8
#Добавляется определение типа вагона type passeger
# Для пассажирских вагонов:
# Добавить атрибут общего кол-ва мест (задается при создании вагона)
# Добавить метод, который "занимает места" в вагоне (по одному за раз)
# Добавить метод, который возвращает кол-во занятых мест в вагоне
# Добавить метод, возвращающий кол-во свободных мест в вагоне.

require_relative 'wagon'
class WagonPassenger < Wagon
	attr_accessor :number
	attr_reader :type, :seats
	def initialize(seats)
		@type = 'passenger'
		@seat = 0
		@seats = seats
	end

	def seat
		@seat +=1 if @seat < @seats
	end

	def seat_busy
		@seat
	end

	def seat_free
		seat_free = @seats - @seat
	end
end

