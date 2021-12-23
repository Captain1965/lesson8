#encoding utf-8
#создается вагон
require_relative 'manufacturer_name'
class Wagon
	include ManufacturerName
	attr_accessor :number
end
