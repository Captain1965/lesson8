#encoding - utf-8
=begin
     - Создавать станции
     - Создавать поезда
     - Создавать маршруты и управлять станциями в нем (добавлять, удалять)
     - Назначать маршрут поезду
     - Добавлять вагоны к поезду
     - Отцеплять вагоны от поезда
     - Перемещать поезд по маршруту вперед и назад
     - Просматривать список станций и список поездов на станции
=end
  require_relative 'show'
  require_relative 'wagon'
  require_relative 'wagon_passenger'
  require_relative 'wagon_cargo'
  require_relative 'train'
  require_relative 'passenger_train'
  require_relative 'cargo_train'
  require_relative 'station'
  require_relative 'route'
  require_relative ''
                                            # Методы меню вагонов
  def wagon_make
    puts ' Какой вагон необходим 1-грузовой , иное - пассажирский'
    a2 = STDIN.gets.chomp
      wagon = WagonCargo.new if a2 == '1'
      wagon = WagonPassenger.new if a2 != '1'
      puts ' Введите номер вагона '
      wagon.number = STDIN.gets.chomp
      return wagon
  end
                                          # Методы меню станций
  def station_make(stations)
  puts ' Введите названия cтанций , для прекращения введите 0'
  loop do
    name = STDIN.gets.chomp
      break if name == '0'
      stations << Station.new(name) 
    end 
    return stations
  end
                                                   # Методы меню поездов
  def train_make
     puts ' Какой состав вы формируете 1-грузовой , иное - пассажирский'
      a2 = STDIN.gets.chomp
      train = CargoTrain.new if a2 == '1'
      train = PassengerTrain.new if a2 != '1'
      puts ' Введите номер поезда'
      a2 = STDIN.gets.chomp
      train.number = a2
      return train
  end 
                                                    # Метод добавления вагона к поезду                                
  def train_add_wagon(trains,wagons)
    return if trains.empty? || wagons.empty?
    trains_show(trains)
    puts ' Выберите номер поезда для добавления вагонов'
    a = STDIN.gets.chomp
    t = 0                            #номер элемента массива в списке поездов с выбранным номером
    trains.each do |item|
      t = trains.index(item) if item.number == a
    end      
      wagon_show(wagons)
      puts ' Выберите номер вагона'
      w = 0                                          # номер элемента массива в списке вагонов выбранный для присоединения
      a = STDIN.gets.chomp
      wagons.each do |item|
        w = wagons.index(item) if item.number == a
      end
         if wagons[w].type != trains[t].type
          puts ' Типы поезда и вагона не совпадают'
          return 
        else 
          trains[t].add_wagon(wagons[w])                     
        end
        return trains
  end
                                                    # метод удаления вагона из поезда
  def train_delete_wagon(trains,wagons)
    trains_show(trains)
    puts ' Выберите номер поезда для  уменьшения количества вагонов'
    a = STDIN.gets.chomp
    t = 0                                                 # номер элемента в списке массива 
    trains.each do |item|
      t = trains.index(item) if item.number == a
    end 
    trains[t].delete_wagon        
  end                                                          

def train_assign_route(trains,routes)
    trains_show(trains)
    puts ' Выберите номер поезда для назначения маршрута'
    a = STDIN.gets.chomp
    t = 0                                                    # номер элемента массива в списке поездов с выбранным номером
    trains.each do |item|
      t = trains.index(item) if item.number == a
    end
    puts 
    route_show(routes,stations)      
    return if routes.empty?
    puts ' Выберите номер маршрута'
    r = STDIN.gets.chomp.to_i
    trains[t].route = routes[r]
    trains[t].add_route
    return trains[t]
  end 

  def trains_departure(trains)
    trains_show(trains)
    puts ' Выберите номер поезда для движения по маршруту'
    a = STDIN.gets.chomp.to_i
    t = 0                                                   # номер элемента массива в списке поездов с выбранным номером
    trains.each do |item|
      t = trains.index(item) if item.number == a
    end
    trains[t].departure
    puts " Поезд находится на станции #{trains[t].route.stations[trains[t].curent_station_index]}"
    return trains[t]
  end

  def trains_arrival(trains)
    trains_show(trains)
    puts ' Выберите номер поезда для движения по маршруту'
    a = STDIN.gets.chomp
    t = 0                                                    # номер элемента массива в списке поездов с выбранным номером
    trains.each do |item|
      t = trains.index(item) if item.number == a
    end
    trains[t].arrival
    puts " Поезд находится на станции #{trains[t].route.stations[trains[t].curent_station_index]}"
    return trains[t]
  end 
                                                            # методы меню маршрутов
  def route_make(stations)
    if stations.empty?
      puts 'Нет станций для формирования маршрута , создайте список станций'
      return
    end
    stations_name = []
    stations.each do |item|
     stations_name << item.name
    end
      station_show(stations)
      puts ' Введите название начальной станции машрута из списка '
      station_start = STDIN.gets.chomp
      puts ' Введите название конечной станции'
      station_end = STDIN.gets.chomp
      if stations_name.include?(station_start) && stations_name.include?(station_end)
        route = Route.new(station_start,station_end) 
      else 
        puts ' Выбранных станций нет в списке'
        return route = 0
      end 
    return route
  end 

  def route_add(stations,routes)
    stations_name = []
    stations.each do |item|
     stations_name << item.name
    end
    route_show(routes,stations)
    return if routes.empty?
    puts ' Выберите номер маршрута на котором хотите добавить станцию '
    i = STDIN.gets.chomp.to_i
    station_show(stations)
    puts ' Введите название станции которую хотите добавить на маршруте'
    name1 = STDIN.gets.chomp
      if stations_name.include?(name1) 
              routes[i].add_station(name1) 
      else puts ' Станции нет в списке' 
      end
  end

  def route_delete(stations,routes)
    route_show(routes,stations)
    return if routes.empty?
    puts ' Выберите номер маршрута на котором хотите удалить станцию'
    i = STDIN.gets.chomp.to_i
    puts ' Выберите название станции которую хотите удалить'
    name = STDIN.gets.chomp
    routes[i].delete_station(name)
  end
  
  MAIN_MENU =
  '  
    Выберите тип операции 
  1 - операции с вагонами
  2 - операции с поездами
  3 - операции со станциями
  4 - операции с маршрутами
  0 - выйти'

  WAGOON_MENU =
  '  
    Выберите операцию 
  1 - создать вагон
  2 - просмотреть все вагоны
  0 - вернуться в главное меню'

  TRAIN_MENU =
  ' 
     Выберите операцию
  1 - создать поезд
  2 - добавить вагон
  3 - удалить вагон
  4 - просмотреть все поезда
  5 - назначить маршрут поезду
  6 - поехать по маршруту
  7 - вернуться по маршруту
  8 - просмотреть где находятся поезда 
  0 - вернуться в главное меню'

  STATION_MENU =
  '  
    Выберите операцию
  1 - создать список станций
  2 - просмотреть станции
  3 - просмотреть поезда на станции
  0 - вернуться в главное меню'

  ROUTES_MENU =
  '  
    Выберите операцию 
  1 - создать маршрут
  2 - добавить станцию к маршруту
  3 - удалить станцию на маршруте
  4 - показать машруты
  0 - вернуться в главное меню'

#  def start
    wagons = []
    trains = []
    routes = []
    stations = []

      loop do
      puts MAIN_MENU
      a = STDIN.gets.chomp
        case a 
        when '1' #операции с вагонами
          loop do
          puts WAGOON_MENU
          b = STDIN.gets.chomp
            case b 
            when '1'                              
              wagons << wagon_make                # создать вагон и добавить его в список вагонов
            when '2'                              
              wagon_show(wagons)                  # показать список вагонов
            when '0'                          
              break                               #выйти 
            else 
            puts ' Сделайте Ваш выбор'
            end
          end 
        when '2' 
          
          loop do
          puts TRAIN_MENU
          b = STDIN.gets.chomp                 
            case b
            when '1' 
              trains << train_make                 # создать и добавить в список поездов
            when '2' 
              train_add_wagon(trains,wagons)       # поезду добавить вагон
            when '3' 
              train_delete_wagon(trains,wagons)    # отцепить вагон
            when '4' 
              trains_show(trains)                  # просмотреть список поездов
            when '5'
              train_assign_route(trains,routes)    # поезду назначить маршрут 
            when '6'
              trains_departure(trains)             # Поехать по маршруту на одну станцию
            when '7'        
              trains_arrival(trains)               # Вернуться по маршруту на одну станцию
            when '8'
              trains_number_station_show(stations,trains) # Показать номера поездов и станции где они находятся     
            when '0'
            break                                  # Вернуться в главное меню
            else 
             puts " Сделайте Ваш выбор"
            end
          end
        when '3' 
          
          loop do
          puts STATION_MENU
          b = STDIN.gets.chomp
            case b
            when '1'
              station_make(stations)                # Создать список станций
            when '2'
              station_show(stations)                # Просмотреть станции
            when '3'
              station_train_show(stations,trains)   # Просмотреть поезда на станции
            when '0'
              break                                 # Вернуться в главное меню
            else 
              puts " Сделайте ваш выбор"
            end
          end 

        when '4'
          loop do
          puts ROUTES_MENU
          b = STDIN.gets.chomp
            case b
            when '1'
              routes << route_make(stations)        # Маршрут создать и добавить в список маршрутов
            when '2'
              route_add(stations,routes)            # Добавить станцию к маршруту
            when '3'
              route_delete(stations,routes)         # Удалить станцию из маршрута
            when '4' 
              route_show(routes,stations)                    # показать маршруты   
            when '0'  
             break                                  # вернуться в главное меню
            else 
            puts ' Сделайте Ваш выбор'
            end 
          end
        when '0'
          break
        end        
      end    
   # end   
