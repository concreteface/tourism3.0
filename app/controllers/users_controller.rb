class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
    unless current_user == @user
      flash[:alert] = "You don't have access to that page!"
      redirect_to user_path(current_user)
      return
    end
  end
end
