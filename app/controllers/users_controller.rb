class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
    gon.id = @user.id
    unless current_user == @user
      flash[:alert] = "You don't have access to that page!"
      redirect_to user_path(current_user)
      return
    end
  end

  def update_photo
    @user = User.find(params[:id])
    if  @user.add_remote_avatar(params[:url_to_save])
      render json: {message: 'success', url: @user.avatar_url}
    else
      render json: {message: 'failure'}
    end
  end
end
