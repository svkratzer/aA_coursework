class UsersController < ApplicationController

    def new
        # @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        
        if @user.save
          # session[:session_token] <-- We are about to set the session cookie in the client's browser
          session[:session_token] = @user.reset_session_token! # (CLIENT-SIDE) = (SERVER-SIDE)
          redirect_to show_url
        else
            flash.now[:error] = ["You didn't enter the right stuff, stupid! Try again!"]
            render :new
        end
        
    end
    
    def show # www.app.com/users/20
      # PARAMS
      # 1. QUERY STRING
      # 2. BODY PARAMS
      # 3. ROUTE PARAMS
      @user = User.find_by(id: params[:id])
      if @user
        render :show
      else
        render text: 'User not found'
      end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password)    
    end
end