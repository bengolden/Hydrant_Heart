class WelcomeController < ApplicationController
  def index
    @recent_claims = Claim.order('created_at desc').limit(10)
    @recent_arguments = Argument.order('created_at desc').limit(10)
  end

  def login
  end
  #login not tested
  def authenticate
    @user = User.find_by_email(params[:email])
    if @user
      if @user.password == params[:password]
        give_token
      else
        redirect_to home_url
      end
    else
      redirect_to "/welcome/login"
    end
  end

end
