class ItemCounter
  @@rides = [] 
  def self.process_ride(ride) 
    @@rides << ride
  end   

  def self.print_items_per_interval
    @@rides.sort_by! { |ride| ride.start_time }
    times = @@rides.flat_map { |ride| [ride.start_time, ride.end_time] }.sort
    current_rides = [@@rides.first] 
    i = 1
    self.print_output(times.first, times[1], current_rides) 
    times.drop(1).each do |current_time|  
      next_time = times[i + 1]
      return if next_time == nil 
      @@rides.each do |r| 
        if current_time == r.start_time
          current_rides.append(r)
        elsif current_time.utc == r.end_time.utc
          current_rides -= [r] 
        end
      end
      self.print_output(current_time, next_time, current_rides)
      i += 1 
    end 
  end

  def self.print_output(first_time, second_time, rides)    
    puts "#{first_time.strftime("%I:%M")} - #{second_time.strftime("%I:%M")}: #{Rides.calculate_items(rides)}" 
  end
end 
