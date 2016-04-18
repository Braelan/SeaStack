

class Api::QuestionsController < ApplicationController
  def new
    @question = Question.new
    render :new
  end

  def index
    if search?
    @questions = Question.text_search(params[:query])
    else
    @questions = Question.includes(:answers).all
    end
    render "index"
  end

  def show
    @question = Question.find(params[:id])
    @comments = @question.comments
    @answers = @question.answers
    render "show"
  end

  def create
   @question = Question.new(question_params)
   if params[:question][:response_notification] == "true"
     @question.response_notification= true;
   else
     @question.response_notification= false;
   end

   if signed_in?
     @question.user_id = current_user.id;
     if @question.save
       render json: @question
     else
     flash.now[:errors] = @question.errors.full_messages
     render :new
     end
   else
    flash.now[:errors] = "You have to be logged in to submit a question"
   end

  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :filepicker_url, :query)
  end

  def search?
    if params[:query]
      return true
    end
    false

  end


end
