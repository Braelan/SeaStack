class Api::AnswersController < ApplicationController

  def create
   @answer = Answer.new(answer_params)
   @answer.user_id = current_user.id
   @answer.save
   flash.now[:errors] = @answer.errors.full_messages
  end

  def show

  end


  private

  def answer_params
    params.require(:answer).permit(:body, :question_id)
  end

end
