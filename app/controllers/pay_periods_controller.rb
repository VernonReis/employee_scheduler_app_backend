class PayPeriodsController < ApplicationController
  before_action :set_pay_period, only: [:show, :update, :destroy]

  # GET /pay_periods
  def index
    @pay_periods = PayPeriod.all.order(start_date: :desc)

    render json: @pay_periods
  end

  # GET /pay_periods/1
  def show
    render json: @pay_period.to_json(include: :schedule_entries)
  end

  # POST /pay_periods
  def create
    @pay_period = PayPeriod.new(pay_period_params)

    if @pay_period.save
      render json: @pay_period, status: :created, location: @pay_period
    else
      render json: @pay_period.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pay_periods/1
  def update
    if @pay_period.update(pay_period_params)
      render json: @pay_period
    else
      render json: @pay_period.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pay_periods/1
  def destroy
    @pay_period.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pay_period
    @pay_period = PayPeriod.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def pay_period_params
    params.require(:pay_period).permit(:start_date, :employer_id)
  end
end
