class Api::V1::LearningResourcesController < ApplicationController
  def index
    if params[:country]
      response = LearningResourceFacade.build(params[:country])
      render json: LearningResourceSerializer.new(response)
    end
  end
end