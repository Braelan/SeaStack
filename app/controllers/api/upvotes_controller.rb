class Api::UpvortesController < ApplicationController
  def new
    @upvote = Upvote.new
  end

  def create
    @upvote = Upvote.new(upvote_params)

    if signed_in?
       @upvote.user_id = current_user.id;
         @upvote.save
         flash.now[:errors] = @answer.errors.full_messages
         render json: @upvote
    end
  end

  private

  def upvote_params
    params.require(:upvote).permit(:question_id, :comment_id, :answer_id, :value, :user_id)

end
