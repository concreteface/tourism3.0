class VisitsController < ApplicationController
  before_filter :authenticate_user!
  def create
    @visit = Visit.new(user_id: params['user_id'], attraction_id: params['attraction_id'].to_i)
    if @visit.save
      render json: {message: 'success'}
    else
      render json: {message: 'failure'}
    end

  end

end
