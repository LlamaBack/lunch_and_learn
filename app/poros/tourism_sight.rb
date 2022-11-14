class TourismSight
  attr_reader :id, :name, :street, :postcode, :city, :country
  def initialize(sight_data)
    @id = nil
    @name = sight_data[:features][0][:properties][:name]
    @street = sight_data[:features][0][:properties][:street]
    @postcode = sight_data[:features][0][:properties][:postcode]
    @city = sight_data[:features][0][:properties][:city]
    @country = sight_data[:features][0][:properties][:country]
  end
end