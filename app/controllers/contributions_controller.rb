eclass ContributionsController < ApplicationController
  def new
    @contribution = Contribution.new
  end

  def create
    @contribution = Contribution.new(contribution_params)

    @trip = Trip.find(params[:trip_id])
    @contribution.user = current_user
    @contribution.fund = @trip.experience.fund

    if @contribution.save
      redirect_to experience_trip_path(@trip)
    else
      render 'new'
    end
  end

  def index
    Contribution.all
  end

  private

  def contribution_params
    params.require(:contribution).permit(:amount_cents)
  end
end
