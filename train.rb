#encoding utf-8
=begin
-Имеет номер (произвольная строка)
Релизовать проверку на формат номера поезда. Допустимый формат: три буквы или цифры
в любом порядке, необязательный дефис (может быть, а может нет) и еще 2 буквы или цифры
после дефиса.
эти данные указываются при создании экземпляра класса
-Может набирать скорость (speed)
-Может возвращать текущую скорость (curent_speed)
-Может тормозить (сбрасывать скорость до нуля)(stop)
-Может принимать маршрут следования (объект класса Route).
-При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
-Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад,
но только на 1 станцию за раз. (arrive_train)
-Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
=end
require_relative 'manufacturer_name'
require_relative 'instance_counter'

class Train

  include InstanceCounter
  include ManufacturerName
  attr_accessor :number, :route, :wagons, :wagon, :trains
  attr_reader :curent_speed, :curent_station_index

  def self.find(train_number)
    @@trains.find {|train| train.number == train_number}
  end


  def initialize(number)
    @train_name = number.to_s
    @@trains = []
    @number = number
    @curent_speed = 0
    @route = []
    @wagons = []
  end

  def add_wagon(wagon)
    @wagons << wagon
  end

  def delete_wagon
    @wagons.delete_at(-1) if @wagons.size > 0
  end

  def speed(value)
    @curent_speed +=value
  end

  def stop
    @curent_speed = 0
  end

  def add_route
    @curent_station_index = 0
  end

  def departure
    @curent_station_index +=1 if @curent_station_index < @route.stations.size-1
  end

  def arrival
    @curent_station_index -=1 if @curent_station_index >= 1
  end

  def valid?
    validate!
    true
  rescue
    false
  end
                                      # метод для проверки
  private
  def validate!
    errors = []
    errors << "Вы ввели неправильный номер поезда" if @train_name !~ /^([а-я0-9])([а-я0-9])([а-я0-9])(-|)([а-я0-9])([а-я0-9])/i
    errors << "Вы не ввели номер поезда" if @train_name ==""
    errors << "Номер не может быть меньше 5 символов" if @train_name < 5
    raise errors.join(";") unless errors.empty?
  end
end
