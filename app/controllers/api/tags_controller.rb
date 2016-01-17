class Api::TagsController < ApplicationController
  def create
    @tag = Tag.new(category: params[:category],question_id: params[:question_id])
    @tag.save
    render json: @tag
    # @tag.question_id = 1;
    # @tag.save
  end


end
