class ContributionsController < ApplicationController
  def new
    @contribution = Contribution.new
  end

  def create
    @contribution = Contribution.new(contribution_params)

    @trip = @contribution.trip
    @contribution.user = current_user
    @experience = @trip.experience

    if @contribution.save
      redirect_to fund_path
    else
      render 'new'
    end
  end

  def index
    Contribution.all
  end

  private

  def contribution_params
    params.require(:contribution).permit(:amount)
  end
end
