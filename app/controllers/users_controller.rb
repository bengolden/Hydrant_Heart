class UsersController < ApplicationController
  include ApplicationHelper

  def show
    @user = User.find_by_id(params[:id])
    @recent_claims = @user.authored_claims.most_recent_first
    @recent_arguments = @user.authored_arguments.most_recent_first
  end

  def new
    @user = User.new
  end
  #not tested
  def create
    @user = User.create(user_params) #not tested
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  private
  #do we test private methods?
  def user_params
    params.require(:user).permit(:username, :email, :password, :image_url)
  end
end
