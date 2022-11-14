class PlacesFacade
  def self.tourism_sights(latlng)
    sights = PlacesService.tourism_sights(latlng)
    create_sights(sights)
  end

  private

  def self.create_sights(sights)
    sights[:features].map do |sight|
      TourismSight.new(sight[:properties])
    end
  end
end
