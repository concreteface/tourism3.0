class AttractionsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show, :search]

  def index
    @attractions = Attraction.order(created_at: :desc).page params[:page]
    if current_user
      gon.user = current_user
      @visited_attractions = current_user.visited_attractions.pluck(:id)
    end
  end

  def show
    @attraction = Attraction.find(params[:id])
    gon.url = "https://maps.googleapis.com/maps/api/js?key=#{ENV['MAPS_KEY']}&callback=initMap"
    @key = ENV['MAPS_KEY']
    @adobe_key = ENV['ADOBE_DEV_ID']
    gon.id = @attraction.id
    if @attraction.latitude && @attraction.longitude
      gon.lat = @attraction.latitude
      gon.long = @attraction.longitude
    else
      gon.lat = 39.8282
      gon.long = -98.5795
    end
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    @attraction.creator = current_user
    if @attraction.save
      flash[:notice] = "You added a photo!"
      redirect_to attraction_path(@attraction)
    else
      flash[:alert] = @attraction.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
    unless current_user == @attraction.creator
      flash[:alert] = "You don't have access to that page!"
      redirect_to attraction_path(@attraction)
      return
    end

  end

  def update
    @attraction = Attraction.find(params[:id])
    if @attraction.update(attraction_params)
      flash[:notice] = 'You updated your photo details'
      redirect_to attraction_path(@attraction)
    else
      flash[:alert] = @attraction.errors.full_messages.join(', ')
      render :edit
    end
  end

  def search
    @query = params[:query]
    @distance = Integer(params[:distance]) rescue false
    if !@distance
      @distance = 10
    end
    @search_results = Attraction.near(@query, @distance).page params[:page]
  end

  def update_photo
    @attraction = Attraction.find(params[:id])
    if  @attraction.add_remote_photo(params[:url_to_save])
      render json: {message: 'success'}
    else
      render json: {message: 'failure'}
    end
  end

  def update_location
    @attraction = Attraction.find(params[:id])
    if @attraction.set_latitude(params[:latitude]) && @attraction.set_longitude(params[:longitude])
      render json: {message: 'success'}
    else
      render json: {message: 'failure'}
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :photo, :description)
  end
end
