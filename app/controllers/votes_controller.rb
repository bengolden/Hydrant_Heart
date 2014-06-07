class VotesController < ApplicationController
  include ApplicationHelper

  def create
    p params[:voteableType]
    vote = Vote.create(
                        user_id: current_user.id,
                        value: params[:value],
                        voteable_type: params[:voteableType],
                        voteable_id: params[:voteableId])

    if vote.valid?
      render nothing: true

      # format.json { render json:
      return "success"
    end
  end

  private

  # def vote_params
  #   params.require(params).permit(:value, :voteableType, :voteableId)

  # end
end
