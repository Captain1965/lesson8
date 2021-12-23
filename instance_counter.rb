=begin
encoding utf-8
Создать модуль InstanceCounter, содержащий следующие методы класса и инстанс-методы, которые подключаются автоматически
при вызове include в классе:
Методы класса:
       - instances, который возвращает кол-во экземпляров данного класса
Инстанс-методы:
       - register_instance, который увеличивает счетчик кол-ва экземпляров класса и который можно вызвать из конструктора.
При этом данный метод не должен быть публичным.
Подключить этот модуль в классы поезда, маршрута и станции.
Примечание: инстансы подклассов могут считаться по отдельности, не увеличивая счетчик инстансев базового класса.
=end
module InstanceCounter
  def self.included(name)
    name.extend ClassMethods
    name.include InstanceMethods
  end

  module ClassMethods
    def instances
      @instances ||= 0
      @instances +=1
    end
  end

  module InstanceMethods
    private
    def register_instances
      self.class.instances
    end
  end
end


