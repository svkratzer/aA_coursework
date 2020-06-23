class UsersController < ApplicationController
  
  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # This line creates a session cookie client-side in the 
      # user's browser.
      session[:session_token] = @user.reset_session_token!
      # In the future redirects the user to another page. For now,
      # it just renders the user in json.

      render json: @user ######### TEMPORARY ############
    else
      flash.now[:error] = @user.errors.full_messages
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end