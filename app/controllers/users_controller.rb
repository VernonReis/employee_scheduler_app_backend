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
    @user.auth_level = 1
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
      @user = {:user => {:username => user.username, :id => user.id}}

      render json: {status: 200, user: @user}
    else
      render json: {error: 'Invalid username / password'}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.permit(:username, :password, :employer_id)
  end

  def authorize_user
    render json: {status: 401, message: "Unauthorized"} unless get_current_user.id == params[:id].to_i
  end
end
