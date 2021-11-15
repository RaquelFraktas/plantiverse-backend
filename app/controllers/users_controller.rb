class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def create 
    user = User.new(user_params)
    if user.save
      render json: {user: UserSerializer.new(user), token: encode_token(user.id)} 
    else
      render json:{errors: user.errors.full_messages.to_sentence}, status: :unprocessable_entity
    end
  end

  def update
    user= User.find(params["_json"][0][:id])
    plant= Plant.find(params["_json"][1])
    if !user.plants.include?(plant)
      user.plants << plant
    end
    render json: user
  end

  private

  def user_params
    params.permit(:username, :password)
  end

end
