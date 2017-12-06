class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: :new
  before_action :set_trip, only: [:edit, :show, :update, :destroy, :confirmation]
  before_action :set_experience, only: [:new, :create, :confirmation]
  skip_before_action :force_temporary_users, only: :new


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

    if @trip.save
      order = Order.create!(sku: @trip.experience.title, amount: @trip.experience.price, state: 'pending', trip_id: @trip.id)
      if params[:trip][:contribution].present?
        @contribution = Contribution.new(user: current_user, trip: @trip, fund: @trip.experience.fund, amount_cents: (params[:trip][:contribution].to_i * 100) )
        if @contribution.amount > 0 && @contribution.save
          contribution_order = Order.create!(sku: @contribution.fund, amount: @contribution.amount, state: 'pending', trip_id: @trip.id, contribution: true )
        end
      end
      redirect_to confirmation_experience_trip_path(@experience.id, @trip.id, order: order, contribution_order: contribution_order )
    else
      render 'new'
    end
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

  def confirmation
    total = @trip.experience.price * @trip.number_of_people
    if @trip.contribution.present?
      @sum = @trip.contribution.amount + total
    else
      @sum = total
    end
  end

  def status
    @trip = Trip.find(params[:trip_id])
    @trip.update(status: params[:status])
    @trip.orders.map { |o| o.capture }
    redirect_to order_path(@trip.order)
  end

  def cancel
    @trip = Trip.find(params[:trip_id])
    @trip.update(cancel: params[:cancel])
    redirect_to profile_path(current_user)
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
    params.require(:trip).permit(:start_date, :first_name, :last_name, :terms, :number_of_people)
  end
end
