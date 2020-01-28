class Journey

  attr_reader :Trips

  def initialize
    @Trips = []
  end

  def trip(entry_station, exit_station)
    self.Trips << {Start: entry_station, End: exit_station}
  end

  def trip_list
    self.Trips.each {|journey| return "Start: #{journey[:Start]}, End: #{journey[:End]}"}
  end

  private
  attr_writer :Trips

end
