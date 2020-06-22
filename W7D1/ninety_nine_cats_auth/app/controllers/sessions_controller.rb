class SessionsController < ApplicationController
    before_action :already_logged_in_redirect, only: [:create, :new]

    def new
        @login = true
        render :new
    end

    def create
        user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )
        if user
            session[:session_token] = user.reset_session_token!
            redirect_to cats_url
        else
            flash.now[:errors] = ['Invalid Credentials']
            render :new
        end
    end 
    
    def destroy
        # current_user = user.reset_session_token!
        current_user.reset_session_token!
        session[:session_token] = nil
        redirect_to new_session_url
    end

end