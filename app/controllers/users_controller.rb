class UsersController < ApplicationController

  def show
    user = User.find_by_username("Puffy")
    @recent_claims = user.authored_claims.most_recent_first
    @recent_claims = user.authored_arguments.most_recent_first
  end

  #not tested
  def new
    @user = User.new #not tested
  end
  #not tested
  def create
    @user = User.new(user_params) #not tested
    @user.save! #not tested
    redirect_to "/users/#{@user.id}"
  end

  private
  #do we test private methods?
  def user_params
    params.require(:user).permit(:username, :email, :password, :image_url)
  end
end
