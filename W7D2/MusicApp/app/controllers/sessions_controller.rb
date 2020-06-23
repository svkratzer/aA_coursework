class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    # Finds a user by the email and password supplied in the 
    # login form, using the find_by_credentials we defined in the user model.
    user = User.find_by_credentials([:user][:email], [:user][:password])

    if user.nil? # Checks if the user was found.
      # Creates a flash containing an error message, if not.
      flash.now[:errors] = ['Incorrect email or password.']
      render :new
    else
      # If the user is found, reset their session_token 
      # in the database (SERVER-SIDE)
      user.reset_session_token!
      # Update the session cookie with the new session_token
      # in the user's browswer (CLIENT-SIDE)
      session[:session_token] = user.session_token

      # Redirect to User#show
      redirect_to user_url(user.id)
    end

  end

  def destroy
    
  end

end