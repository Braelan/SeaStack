class UsersController < ApplicationController
  def new
    #for redirection in create
    session[:return_to] ||=request.referer
    @user = User.new
    render :new
  end

  def create
    # for redirection back
      @user =User.new(user_params)

    if params[:user][:password_confirmation] == user_params[:password] && @user.save
      sign_in(@user)
    #  render json: @user
      redirect_to "/#questions"
      # redirect_to session.delete(:return_to)
    else
      if params[:user][:password_confirmation] != user_params[:password]
         flash.now[:errors] = ["**Passwords do not match**"]

      end
      flash.now[:errors] = flash.now[:errors] ? flash.now[:errors] : @user.errors.full_messages
      # send variables that can be used by erb template
       if flash.now[:errors]
        flash.now[:errors].each do |error|
              if error.include? "Email"
                 @emails = "Email cannot be empty."
               end
               if error.include? "Password"
                 @passwords = "Password cannot be empty."
               end
          end
        end
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
