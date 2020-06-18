class UsersController < ApplicationController

    def index
        if params.has_key?(:username)
            @users = User.where(username: params[:username])
        else
            @users = User.all
        end
        render json: @users 
    end

    def create
      user = User.new(user_params)
      if user.save
        render json: user
      else
        render json: user.errors.full_messages, status: 422
      end
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def update

        @user = User.find(params[:id])
        
        if @user 
            @user.update!(user_params)
            render json: @user
        else 
            render json: @user.errors.full_messages, status: 304
        end

    end 

    def destroy
        user = User.find(params[:id])
        user.delete
        render json: user 
    end 
    
    private

    def user_params
        params.require(:user).permit(:username)
    end

end
