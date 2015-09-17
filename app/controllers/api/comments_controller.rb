class Api::CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      render json: @comment
    else
      flash.now[:error] = @comment.full_messages
      redirect_to(:back)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :question_id)
  end
end
