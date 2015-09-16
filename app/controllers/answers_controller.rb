class AnswersController < ApplicationController

  def create
   @answer = Answer.new(answer_params)
   @answer.user_id = current_user.id
   if @answer.save
     render json: @answer
   else
     flash.now[:errors] = @answer.errors.full_messages
     redirect_to(:back)
   end
  end


  private

  def answer_params
    params.require(:answer).permit(:body, :question_id)
  end

end
