class Api::QuestionsController < ApplicationController
  def new
    @question = Question.new
    render :new
  end

  def index
    @questions = Question.all
    render "index"
  end

  def show
    @question = Question.find(params[:id])
    render "show"
  end

  def create
   @question = Question.new(question_params)

   if params[:question][:response_notification] == "true"
     @question.response_notification= true;
   else
     @question.response_notification= false;
   end
   @question.user_id = current_user.id;

   if @question.try(:save)
     render :show
   else
   flash.now[:errors] = @question.errors.full_messages
   render :new
   end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def tag_params
    # use to add tags at some point
  end

end
