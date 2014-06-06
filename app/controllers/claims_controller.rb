class ClaimsController < ApplicationController
  def show
    @claim = Claim.find(params[:id])
    @args_for = @claim.arguments_for
    @args_against = @claim.arguments_against
  end
end
