class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :edit]
  before_action :set_experience, only: [:show, :edit, :update, :destroy]
  skip_before_action :force_temporary_users, only: [:index, :show, :new, :edit]
  # before_action :ngo?, only: [:destroy, :update, :create, :new, :edit]

  def index
    @features = Feature.all
    @activities = Activity.all
    @area_types = Areatype.all

    @experiences = policy_scope(Experience).search(params[:query])

    if params[:feature]
      features = Feature.where(name: params[:feature])
      @experiences = @experiences.joins(:experiences_features).where(experiences_features: { feature_id: features.map(&:id) })
    end

    if params[:activity]
      activities = Activity.where(name: params[:activity])
      @experiences = @experiences.joins("INNER JOIN activities_experiences ON activities_experiences.experience_id = experiences.id").where(activities_experiences: { activity_id: activities.map(&:id) })
    end

    if params[:area_type]
      area_types = Areatype.where(name: params[:area_type])
      @experiences = @experiences.joins("INNER JOIN areatypes_experiences ON areatypes_experiences.experience_id = experiences.id").where(areatypes_experiences: { areatype_id: area_types.map(&:id) })
    end

    @markers = Gmaps4rails.build_markers(@experiences) do |experience, marker|
      marker.lat experience.latitude
      marker.lng experience.longitude
      marker.infowindow render_to_string(partial: "map_box", locals: { experience: experience })
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    respond_to do |format|
      if @experience.update(experience_params)
        format.html { redirect_to @experience, notice: 'Experience was successfully updated.' }
        format.json { render :show, status: :ok, location: @experience }
      else
        format.html { render :edit }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
      authorize @experience
    end
  end

  def show
    @experience_coordinates = { lat: @experience.latitude, lng: @experience.longitude }
    @review = Review.new

    @markers = Gmaps4rails.build_markers(@experience) do |experience, marker|
      marker.lat experience.latitude
      marker.lng experience.longitude
      marker.infowindow render_to_string(partial: "map_box", locals: { experience: experience })
    end
    # @conversation = Conversation.new
  end

  def destroy
    @experience.destroy
    respond_to do |format|
      format.html { redirect_to experiences_url, notice: 'Experience was successfully destroyed.' }
      format.json { head :no_content }
    end
    authorize @experience
  end

  def new
    @experience = Experience.new
    authorize @experience
    if !current_user.funds.any?
      redirect_to new_fund_path

    end
  end



  def create
    @experience = Experience.new(experience_params)
    authorize @experience
    @experience.user = current_user

    respond_to do |format|
      if @experience.save
        format.html { redirect_to @experience, notice: 'Experience was successfully created.' }
        format.json { render :show, status: :created, location: @experience }
      else
        format.html { render :new }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  private
    def set_experience
      @experience = Experience.find(params[:id])
      authorize @experience
    end

    def experience_params
      params.require(:experience).permit(:short_description, :long_description, :title, :price_cents, :capacity, :address, :city, :country, :duration, :postal_code, :fund_id, photos: [], feature_ids: [], activity_ids: [], areatype_ids: [])
    end
end


