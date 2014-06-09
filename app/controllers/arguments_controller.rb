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
    @position = (@argument.is_supporting == false ? "Supporting" : "Opposing")
    @conclusion = @argument.conclusion
    @author = @argument.author
    @premises = @argument.premises
    @users_supporting = @argument.users_supporting.uniq
    @users_opposing = @argument.users_opposing.uniq

  end

  def new
    redirect_to "/users/new" unless current_user
    @argument = Argument.new
    3.times { @argument.premises << Claim.new }
  end

  def create
    @conclusion = Claim.find_or_create_by(body: params[:conclusion][:body]) #, is_supporting: params[])
    current_user.authored_claims << @conclusion

    current_user.authored_arguments << ( @argument = Argument.find_or_create_by(is_supporting: true, conclusion_id: @conclusion.id) )
    
    @argument.premises << Claim.create(author_id: current_user.id, body: params[:premise1][:body])
    @argument.premises << Claim.create(author_id: current_user.id, body: params[:premise2][:body])
    @argument.premises << Claim.create(author_id: current_user.id, body: params[:premise3][:body])
  
    redirect_to "/arguments/#{@argument.id}"
    # @params = params # Activate for debugging, and comment out above redirect
  end

  private

  def arg_params
    params.require(:argument).permit(:conclusion_id, :premise1_id, :premise2_id, :premise3_id)
  end

end
