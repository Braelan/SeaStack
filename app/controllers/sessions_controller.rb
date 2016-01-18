class SessionsController < ApplicationController
   before_action :require_signed_out!, only: [:new, :create]
   before_action :require_signed_in!, only: [:destroy]

   def new
    render :new
   end

   def create
      if env['omniauth.auth']
        user = User.from_omniauth(env['omniauth.auth'])
        sign_in(user)
        redirect_to '/#questions', notice: "Signed in"
      else
         @user = User.find_by_credentials(
         params[:user][:email],
         params[:user][:password]
         )
         if @user
           sign_in(@user)
           redirect_to users_url
         else
           flash.now[:errors] = ["invalid username or password."]
           render :new
         end
      end

   end





   def destroy
     sign_out
     redirect_to new_session_url
   end

   private

   def session_params
     params.require(:user).permit(:email, :password)
   end


end
