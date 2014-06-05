class WelcomeController < ApplicationController
  ##NOT TESTED
  def index
    @recent_claims = Claim.order('created_at desc').limit(10)
    @recent_arguments = Argument.order('created_at desc').limit(10)
  end
end
