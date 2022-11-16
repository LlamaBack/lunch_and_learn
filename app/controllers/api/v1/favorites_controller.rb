class Api::V1::FavoritesController < ApplicationController
  before_action :key_check

  def create
    user = User.find_by(api_key: params[:api_key])
    favorite = user.favorites.new(favorite_params)
    if favorite.save
      render json: { success: "Favorite added successfully" }, status: 201
    end
  end

  def index
    user = User.find_by(api_key: params[:api_key])
    render json: FavoriteSerializer.new(user.favorites)
  end

  private
  def key_check
    # if !User.find_by(api_key: params[:api_key])
    render json: { error: "Invalid API Key" }, status: 400 unless User.find_by(api_key: params[:api_key])
    # end
  end

  def favorite_params
    params.permit(:country, :recipe_title, :recipe_link)
  end
end
