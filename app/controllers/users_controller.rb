class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: get_current_user.to_json(include: {tools: {include: :tags}})
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: {status: 200, user: user}
    else
      flash.now.alert = 'Email or password is invalid'
      render :new
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:username, :password, :img)
  end

  def payload(id, username, img)
    {
      exp: (Time.now + 30.minutes).to_i,
      iat: Time.now.to_i,
      iss: ENV['JWT_ISSUER'],
      user: {
        id: id,
        username: username,
        img: img,
      },
    }
  end

  def create_token(id, username, img)
    JWT.encode(payload(id, username, img), ENV['JWT_SECRET'], 'HS256')
  end

  def get_current_user
    return if !bearer_token
    decoded_jwt = decode_token(bearer_token)
    User.find(decoded_jwt[0]["user"]["id"])
  end

  def authorize_user
    render json: {status: 401, message: "Unauthorized"} unless get_current_user.id == params[:id].to_i
  end
end
