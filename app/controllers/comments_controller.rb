class CommentsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: {message: 'success'}
    else
      render json: {message: 'failure'}
    end
  end


  def js_delete
    @comment = Comment.find_by(body: params['body_string'], user: current_user)
    @comment.destroy
    render json: {message: 'success'}
  end


  private

  def comment_params
    params.permit(:body, :attraction_id, :user_id)
  end


end
