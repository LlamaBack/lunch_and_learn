class Api::V1::TouristsSightsController < ApplicationController
  def index
    latlng = CountryFacade.capital(params[:country])
    response = PlacesFacade.tourism_sights(latlng)
    render json: TouristSightSerializer.new(response)
  end
end