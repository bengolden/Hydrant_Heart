class ClaimsController < ApplicationController
  include ApplicationHelper

  def show
    @claim = Claim.find(params[:id])
    @args_for = @claim.arguments_for
    @args_against = @claim.arguments_against
    @args_based_on = @claim.arguments_where_premise
    @author = @claim.author
  end

  #not tested
  def new
    redirect_to "/users/new" unless current_user
    @claim = Claim.new
  end

  def create
    puts params
    @claim = Claim.create(body: claim_body[:body], author_id: current_user.id)
    redirect_to "/"
  end

  private

  def claim_body
    params.require(:claim).permit(:body)
  end

end
