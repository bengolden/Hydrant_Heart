class WelcomeController < ApplicationController
  def index
    @recent_claims = Claim.most_recent_first
    @recent_arguments = Argument.most_recent_first
  end

  #login not tested
  def login
  end

  def signout
    session.clear
    redirect_to "/"
  end

  #authenticate not tested
  def authenticate
    @user = User.find_by_email(params[:email])
    if @user
      if @user.password == params[:password]
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to "/"
      end
    else
      redirect_to "/welcome/login"
    end
  end

end
