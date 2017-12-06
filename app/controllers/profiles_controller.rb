class ProfilesController < ApplicationController
  skip_before_action :force_temporary_users, only: [:update, :edit]

  def show
    @user = current_user
    @trips = @user.trips
    @experiences = @user.experiences
    @ngo_trips = @experiences.flat_map{|experience| experience.trips}
  end

  def edit
      @user = current_user
  end

  def update
    if current_user.update(user_params)
      current_user.update(temporary: false)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:form_user).permit(:email)
  end

 def new
    @profile = Profile.new
    authorize @fund
  end

end
