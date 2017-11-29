class ProfilesController < ApplicationController

  def show
    @user = current_user
    @ngo_experiences = Experience.where(:user == @user)
    @trips = @user.trips
    @experiences = @user.experiences
  end

end
