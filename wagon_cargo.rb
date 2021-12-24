#encoding utf-8
#Добавляется определение типа вагона type cargo
# Добавить атрибут общего объема (задается при создании вагона)
# Добавить метод, которые "занимает объем" в вагоне (объем указывается в качестве параметра метода)
# Добавить метод, который возвращает занятый объем
# Добавить метод, который возвращает оставшийся (доступный) объем

require_relative 'wagon'

class WagonCargo < Wagon
	attr_accessor :number
	attr_reader :type, :volume

	def initialize(volume)
		@volume = volume
		@volume_busy  = 0
		@type = 'cargo'
	end

	def load_wagon(volume_cargo)
		@volume_busy += volume_cargo if volume_cargo <= self.volume_free

	end

	def volume_busy
		@volume_busy
	end

	def volume_free
	 @volume - @volume_busy
	end
end
