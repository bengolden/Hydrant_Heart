require 'spec_helper'

describe WelcomeController do

  context "the instance variables are right" do

    it "has the most recent claims in @recent_claims" do
      get :index
      # claim1 = Claim.create(author_id: 1, body: "Hello")
      # claimid1 = claim1.id
      # claim2 = Claim.create(author_id: 1, body: "Goodbye")
      # claimid2 = claim2.id
      @recent_claims.first.id.should equal(claimid2)
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
