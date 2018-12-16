class WelcomeController < ApplicationController
  skip_filter :check_authentication

  def login
    username = params[:username]
    password = params[:password]
    hashed_password = hash(username, password)
    @user = User.where(username: username, hashed_password: hashed_password).first
	if @user.is_a?(User)
      reset_session #to avoid session fixation
      session[:username] = @user.username
      redirect_to action: :index
    end
  end

  def logout
    session[:username] = nil
    @user = nil
  end

  private
  def hash(salt, string)
    string
  end
end
