class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :force_temporary_users, unless: :devise_controller?
    include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :set_vary_header, :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  rescue_from Pundit::NotAuthorizedError,   with: :user_not_authorized


  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :ngo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def force_temporary_users
    if current_user&.temporary?
      redirect_to edit_profile_path(current_user)
    end
  end

  private
  def set_vary_header
    if request.xhr?
      response.headers["Vary"] = "accept"
    end
  end
  def skip_pundit?
    params[:controller] != 'experiences'
  end

  def user_not_authorized(exception)
    redirect_to root_path
  end

  def default_url_options
  { host: ENV["www.troveko.org"] || "localhost:3000" }
  end
end


