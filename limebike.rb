require "date" 

require './ride.rb'
require './item_counter.rb'
require './rides.rb'

rides = Rides.new.objects 
rides.each {|ride| ItemCounter.process_ride(ride) }
ItemCounter.print_items_per_interval
