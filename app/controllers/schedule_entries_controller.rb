class ScheduleEntriesController < ApplicationController
  before_action :set_schedule_entry, only: [:show, :update, :destroy]

  # GET /schedule_entries
  def index
    @schedule_entries = ScheduleEntry.all

    render json: @schedule_entries
  end

  # GET /schedule_entries/1
  def show
    render json: @schedule_entry
  end

  # POST /schedule_entries
  def create
    @schedule_entry = ScheduleEntry.new(schedule_entry_params)

    if @schedule_entry.save
      render json: @schedule_entry, status: :created, location: @schedule_entry
    else
      render json: @schedule_entry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /schedule_entries/1
  def update
    if @schedule_entry.update(schedule_entry_params)
      render json: @schedule_entry
    else
      render json: @schedule_entry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /schedule_entries/1
  def destroy
    @schedule_entry.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_schedule_entry
    @schedule_entry = ScheduleEntry.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def schedule_entry_params
    params.require(:schedule_entry).permit(:employee_id, :start_time, :end_time, :employer_id)
  end
end
