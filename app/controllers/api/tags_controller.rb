class Api::TagsController < ApplicationController
  def create

  end

  def tag_params
    # use to add tags at some point
    params.require(:question).permit(:category)
  end
end
