class CommentsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  # respond_to :js

  def create
    # binding.pry
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: {message: 'success'}
    else
      render json: {message: 'failure'}
    end
  end

  def comment_params
    params.permit(:body, :attraction_id, :user_id)
  end


end
