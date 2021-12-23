#encoding utf-8 
def wagon_show(wagons)
  return if wagons.empty?                                              # показать список вагонов
  puts ' У вас имеются вагоны'
  wagons.each do |i| 
    puts " вагон номер #{i.number} тип #{i.type}"
    end  
end

def trains_show(trains)                                               # просмотреть список поездов
  puts "  Всего сфомированo поездов  #{trains.size}"
  #puts trains[0].wagons
  #puts trains[1] 
  trains.each do |i|      puts " Поезд номер #{i.number} имеет тип #{i.type}     количество вагонов #{i.wagons.size}"
  end  
end

def route_show(routes,stations)                                              # показать маршруты  
  if routes.empty? || stations.empty?
    puts ' В списке нет сформированных маршрутов'
    return 
  else puts ' Вы можете выбрать следующие маршруты :'
  end 
  routes.each_with_index do |item, index|
    puts " маршрут №  #{index}     начало маршрута #{item.stations[0]}    конец маршрута #{item.stations[-1]}"
    puts " Станции по пути следования :"
    item.stations.each do |i|
      print "  #{i}"
    end    
    puts
  end
  puts
end 

def station_show(stations)                                              # Просмотреть станции
  puts ' У вас имеются следующие станции'
  stations.each do |item|
  puts "    #{item.name}"
  end
end
                                                          # Показать номера поездов и станции где они находятся 
def trains_number_station_show(stations,trains)
  if trains.empty?
    puts ' Нет сформированных составов . Сформируйте составы с указанием маршрута движенния '
    return
  end                         
  puts "  Список поездов с информацией об иx месте нахождения"
  trains.each do |i| 
    puts " Поезд номер #{i.number}  находится на станции #{i.route.stations[i.curent_station_index]}" if i.route != nil 
  end 
end

def station_train_show(stations,trains)
  if trains.empty?
    puts ' Нет сформированных составов . Сформируйте составы с указанием маршрута движенния '
    return
  end
  puts " Список станций с находящимися на них поездами"
  trains.each do |i|
    puts " На станции #{i.route.stations[i.curent_station_index]}  находится поезд номер #{i.number}" if i.route != nil
  end
end