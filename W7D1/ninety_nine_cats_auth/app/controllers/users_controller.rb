class UsersController < ApplicationController
    before_action :already_logged_in_redirect, only: [:create, :new]
    before_action :ensure_logged_in, except: [:create, :new]

    def new
        @user = User.new
        @signup = true
        render :new
    end

    def index
        users = User.all
        render json: users
    end


    def create
        @user = User.new(user_params)
      
        if @user.save
            session[:session_token] = @user.reset_session_token!
            redirect_to cats_url
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end