class UsersController < ApplicationController

  def show
    user = User.find_by_username("Puffy")
    @recent_claims = user.authored_claims.most_recent_first
    @recent_claims = user.authored_arguments.most_recent_first
  end
end
