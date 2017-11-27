class TripsController < ApplicationController
  before_action :set_trip, only: [:edit, :show, :update, :destroy]
  before_action :set_experience, only: [:new, :create]

  def index
    @trips = Trip.all
  end

  def show
    @user = current_user
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)

    @trip.experience = @experience
    @trip.user = current_user
  end

  def edit
  end

   def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Your reservation has been updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
     @trip.destroy
  end

  private
  def set_trip
    @trip = Trip.find(params[:id])
  end
  def set_experience
    @experience =  Experience.find(params[:experience_id])
  end

  def trip_params
    params.require(:trip).permit(:start_date, :end_date)
  end
end
