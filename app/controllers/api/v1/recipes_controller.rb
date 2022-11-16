class Api::V1::RecipesController < ApplicationController
  def index
    if params[:country]
      response = RecipeFacade.search(params[:country])
    else
      response = RecipeFacade.search(params[CountryFacade.random])
    end
    render json: RecipeSerializer.new(response)
  end
end