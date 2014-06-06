class UsersController < ApplicationController

  def show
    # @recent_claims = current_user.authored_claims.most_recent_first
    # @recent_arguments = current_user.authored_arguments.most_recent_first
    
  end

  def new
    @user = User.new
  end
  #not tested
  def create
    @user = User.create(user_params) #not tested
    redirect_to "/users/#{@user.id}"
  end

  private
  #do we test private methods?
  def user_params
    params.require(:user).permit(:username, :email, :password, :image_url)
  end
end
