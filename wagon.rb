#encoding utf-8
#создается вагон
require_relative 'manufacturer_name'
class Wagon
	#include ManufacturerName
	attr_accessor :number, :volume, :volume_busy, :volume_free
	def initialize(number,volume)
		@volume_free = volume
		@volume_busy = 0
		@number = number
	end

	def load_wagon(quantity)
		if @volume_free >= quantity
			@volume_busy += quantity
			@volume_free -= quantity
		end
	end
end



