class ArgumentsController < ApplicationController
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
  	@arguments = Argument.all
  end

  def show
  	@argument = Argument.find(params[:id])
    @position = @argument.is_supporting ? "supporting" : "opposing"
    @conclusion = @argument.conclusion
    @author = @argument.author
    @premises = @argument.premises
  end

  def new
    redirect_to "/users/new" unless current_user
    @all_claims = Claim.all
    @argument = Argument.new
  end

  def create
    @premise1 = Claim.find(arg_params[:premise1_id])
    @premise2 = Claim.find(arg_params[:premise2_id])
    @premise3 = Claim.find(arg_params[:premise3_id])
    @conclusion = Claim.find(arg_params[:conclusion_id])

    @arg = Argument.create(author_id: current_user.id, is_supporting: true, conclusion_id: @conclusion.id)
    [@premise1, @premise2, @premise3].each do |premise|
      @arg.premises << premise
    end
    redirect_to "/arguments/#{@arg.id}"
  end

  private

  def arg_params
    params.require(:argument).permit(:conclusion_id, :premise1_id, :premise2_id, :premise3_id)
  end

end
