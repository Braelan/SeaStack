class Api::AnswersController < ApplicationController

  def create
    # add https if the user doesn't put it on the front
   @answer = Answer.new(answer_params)
   @answer.user_id = current_user.id
   @answer.save

   flash.now[:errors] = @answer.errors.full_messages
   render :show
  end

  def show

  end


  private

  def answer_params
    params.require(:answer).permit(:body, :question_id, :link_url)
  end

end
