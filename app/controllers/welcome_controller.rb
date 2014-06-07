class WelcomeController < ApplicationController
  def index
    @recent_claims = Claim.order('created_at desc').limit(10)
    @recent_arguments = Argument.order('created_at desc').limit(10)
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
