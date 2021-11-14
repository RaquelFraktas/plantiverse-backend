class SessionsController < ApplicationController

    def create
      user= User.find_by_username(params[:username])
      if user && user.authenticate(params[:password])
        render json: user
      else
        render json: {errors: "Invalid Username and/or Password"}, status: :forbidden
    end

end
