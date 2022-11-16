class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    user.api_key = SecureRandom.uuid
    user.save
    render json: UserSerializer.new(user), status: 201
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
