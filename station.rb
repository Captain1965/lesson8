#encoding utf-8
=begin
-Название может указываться при создании
-Может принимать поезда (по одному за раз) (arrive_train)
-Может возвращать список всех поездов на станции, находящиеся в текущий момент (attr_reader trains )
-Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских(train_by_type)
-Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов,(gone_train)
находящихся на станции).
=end
require_relative 'instance_counter'

class Station
	include InstanceCounter
	attr_reader :trains_station, :name, :stations_name
	attr_writer :train
	def self.all
		@@stations
	end
	def initialize(name)
		@name = name
		@@stations << name
		trains_station = []
	end
	def trains
		trains_station.count
	end

	def arrive_train(train)
		@trains_station << train
	end

	def gone_train(train)
		@trains.delete(train)
	end

	def valid?
    validate!
    true
  rescue
    false
  end

  	private # 											метод валидации
 	def validate!
 		errors = []
    errors << "Вы ввели неправильное название станции"	if @name !~ /^([А-Я])([а-я]){1,}/
    errors << "Вы не ввели название станции" if @name == ""
    raise errors.join(";") unless errors.empty?
  end
end

