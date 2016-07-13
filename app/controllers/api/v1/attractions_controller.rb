class Api::V1::AttractionsController < ApplicationController

  def index
    render json: Attraction.all
  end


end