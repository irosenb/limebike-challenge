class Ride
  attr_reader :start_time, :end_time, :items 
  def initialize(start_time, end_time, items=[])
    @start_time = start_time
    @end_time = end_time 
    @items = items
  end

  def to_s
    items.map { |i| i.to_s }.join(", ")
  end
end