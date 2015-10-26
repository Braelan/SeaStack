class Api::UpvotesController < ApplicationController
  def new
    @upvote = Upvote.new
  end

  def create
    if signed_in?
    @upvote = current_user.upvotes.find_or_initialize_by(question_id: params[:upvote][:question_id])
       @upvote.user_id = current_user.id;
         @upvote.update(upvote_params)
         flash.now[:errors] = @upvote.errors.full_messages
         render json: @upvote
    end
  end

  private

  def upvote_params
    params.require(:upvote).permit(:question_id, :comment_id, :answer_id, :value)
  end
end
