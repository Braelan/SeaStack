class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create

      @user =User.new(user_params)

    if params[:user][:password_confirmation] == user_params[:password] && @user.save
      sign_in(@user)
      render json: @user
    else
      if params[:user][:password_confirmation] != user_params[:password]
         flash.now[:errors] = ["**Passwords do not match**"]

      end
      flash.now[:errors] = flash.now[:errors] ? flash.now[:errors] : @user.errors.full_messages
      render :new
    end
  end

  def show
  end

  def index
    render :index
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
