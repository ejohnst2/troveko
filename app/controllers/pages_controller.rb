class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]
  skip_before_action :force_temporary_users, only: [:home, :about]

  def home
    @experiences=Experience.limit(6)
  end

  def show
    render template: "pages/#{params[:page]}"
  end

  def about
  end
end
