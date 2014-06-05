class WelcomeController < ApplicationController
  def index
    @recent_claims = Claim.order('created_at desc').limit(10)
    @recent_arguments = Argument.order('created_at desc').limit(10)
  end
end
