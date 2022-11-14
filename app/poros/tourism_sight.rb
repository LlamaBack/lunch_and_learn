class TourismSight
  attr_reader :id, :name, :address, :place_id

  def initialize(sight_data)
    @id = nil
    @name = sight_data[:name]
    @address = "#{@name}, #{sight_data[:street]}, #{sight_data[:postcode]} #{sight_data[:city]}, #{sight_data[:country]}"
    @place_id = sight_data[:place_id]
  end
end