class TripsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :new --> even new now requires user to be logged in
  before_action :set_trip, only: [:edit, :show, :update, :destroy, :confirmation]
  before_action :set_experience, only: [:new, :create, :confirmation]
  skip_before_action :force_temporary_users, only: :new


  def index
    @trips = current_user.trips
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
        @contribution = Contribution.new(user: current_user, trip: @trip, fund: @trip.experience.fund, amount: (params[:trip][:contribution].to_i * 100) )
        if @contribution.amount > 0 && @contribution.save
          contribution_order = Order.create!(sku: @contribution.fund.title, amount: @contribution.amount, state: 'pending', trip_id: @trip.id, contribution: true )
        end
      end
      UserMailer.trip_request(@trip, @trip.email).deliver_now
      UserMailer.trip_request_host_notification(@trip, @trip.experience.user).deliver_now
      redirect_to confirmation_experience_trip_path(@experience.id, @trip.id, order: order, contribution_order: contribution_order )
    else
      render 'new'
    end

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
    total = @trip.experience.price * @trip.number_of_people.to_i
    if @trip.contribution.present?
      @sum = ( @trip.contribution.amount + total ) / 100
    else
      @sum = total / 100
    end
  end

  def status
    @trip = Trip.find(params[:trip_id])
    @trip.update(status: params[:status])
    @trip.orders.map { |o| o.capture }
    redirect_to order_path(@trip.orders.first)
  end

  def cancel
    @trip = Trip.find(params[:trip_id])
    authorize @trip

    @trip.update(cancel: true)
    UserMailer.cancel(current_user, @trip).deliver_now
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
    params.require(:trip).permit(:start_date, :first_name, :last_name, :email, :terms, :number_of_people)
  end

end
