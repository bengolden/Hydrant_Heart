class UsersController < ApplicationController

  def index
    user = User.find(session[:user_id])
  end

  def new
  end
end
