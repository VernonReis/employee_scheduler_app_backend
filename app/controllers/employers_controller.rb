class EmployersController < ApplicationController
  before_action :set_employer, only: [:show, :update, :destroy]

  # GET /employers
  def index
    @employers = Employer.all

    render json: @employers.to_json(include: [:employees, :pay_periods])
  end

  # GET /employers/1
  def show
    render json: @employer.to_json(include: [:employees, :pay_periods])
  end

  # POST /employers
  def create
    @employer = Employer.new(employer_params)

    if @employer.save
      render json: @employer, status: :created, location: @employer
    else
      render json: @employer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /employers/1
  def update
    if @employer.update(employer_params)
      render json: @employer
    else
      render json: @employer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /employers/1
  def destroy
    @employer.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employer
    @employer = Employer.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def employer_params
    params.require(:employer).permit(:company_name)
  end
end
