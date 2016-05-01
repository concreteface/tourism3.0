class VisitsController < ApplicationController
  before_filter :authenticate_user!
  def create
    @visit = Visit.new(visit_params)
    if @visit.save
      render json: {message: 'success'}
    else
      render json: {message: 'failure'}
    end

  end

  def destroy
    @visit = Visit.find_by(user_id: params[:user_id], attraction_id: params[:id])
    @visit.delete
    render json: { message: "success" }
  rescue NoMethodError
    render json: { message: "failure" }
  end

  private

  def visit_params
    params.permit(:user_id, :attraction_id)
  end


end
