class Api::V1::TouristsSightsController < ApplicationController
  def index
    response = CountryFacade.capital(params[:country]) #latlng
  end
end