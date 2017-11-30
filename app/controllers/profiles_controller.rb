class ProfilesController < ApplicationController

  def show
    @user = current_user
    @trips = @user.trips
    @experiences = @user.experiences
    @ngo_trips = @experiences.flat_map{|experience| experience.trips}
  end

end