class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        user = User.find_by_credentials(
            params[:user][:username]
            params[:user][:password]
        )
        if user
            session[:session_token] = user.reset_session_token!
            redirect user_url(user.id)
        else
            flash.now[:errors] = ['Invalid Credentials']
            render :new
        end
    end 
    
    
end