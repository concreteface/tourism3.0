class AttractionsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @attractions = Attraction.all
    if current_user
      gon.user = current_user
      @visited_attractions = current_user.visited_attractions.pluck(:id)
    end
  end

  def show
    @attraction = Attraction.find(params[:id])
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

  private

  def attraction_params
    params.require(:attraction).permit(:name, :photo, :description)
  end
end
