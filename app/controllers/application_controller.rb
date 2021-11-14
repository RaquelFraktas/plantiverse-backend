class ApplicationController < ActionController::API

  def encode_token(user_id)
    JWT.encode({user_id: user_id}, ENV["JWT_SECRET"])
  end

  def logged_in_user
    User.find(decoded_token["user_id"])
  end

  private 

  def get_token
    request.headers["Authorization"]
  end

  def decoded_token
    JWT.decode(get_token, ENV["JWT_SECRET"])[0]
  end

end
