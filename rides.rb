require 'active_support/core_ext/date_time'
require './ride.rb'
require 'active_support/inflector'

class Rides
  attr_accessor :objects

  def initialize()
    @objects = []
    first_start_time = DateTime.now.change({hour: 7})
    first_end_time = DateTime.now.change({hour: 7, min: 30})
    first_items = [{"apple": 2}, {"brownie": 1}]
    first_ride = Ride.new(first_start_time, first_end_time, first_items)
    @objects.push(first_ride)

    second_start_time = DateTime.now.change({hour: 7, min: 10})
    second_end_time = DateTime.now.change({hour: 8})
    second_items = [{"apple": 1}, {"carrot": 3}]
    second_ride = Ride.new(second_start_time, second_end_time, second_items)
    @objects.push(second_ride)

    third_start_time = DateTime.now.change({hour: 7, min: 20})
    third_end_time = DateTime.now.change({hour: 7, min: 45})
    third_items = [{"apple": 1}, {"brownie": 2}, {"diamond": 4}]
    third_ride = Ride.new(third_start_time, third_end_time, third_items)
    @objects.push(third_ride)
  end

  def self.calculate_items(rides)
    rides.flat_map(&:items).inject{|item, value| item.merge( value ){|k, old_v, new_v| old_v + new_v}}.map do |k, v| 
      k = "#{k}".pluralize if v > 1
      "#{v} #{k}"
    end.join(", ")
  end
end