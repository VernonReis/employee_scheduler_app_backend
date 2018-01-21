class PrivelegesController < ApplicationController
  before_action :set_privelege, only: [:show, :update, :destroy]

  # GET /priveleges
  def index
    @priveleges = Privelege.all

    render json: @priveleges
  end

  # GET /priveleges/1
  def show
    render json: @privelege
  end

  # POST /priveleges
  def create
    @privelege = Privelege.new(privelege_params)

    if @privelege.save
      render json: @privelege, status: :created, location: @privelege
    else
      render json: @privelege.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /priveleges/1
  def update
    if @privelege.update(privelege_params)
      render json: @privelege
    else
      render json: @privelege.errors, status: :unprocessable_entity
    end
  end

  # DELETE /priveleges/1
  def destroy
    @privelege.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_privelege
      @privelege = Privelege.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def privelege_params
      params.require(:privelege).permit(:user_id, :auth_level)
    end
end
