require 'spec_helper'

describe WelcomeController do



  describe "GET 'index'" do
    it "returns http success" do

      get 'index'
      response.should be_success
    end

    it "grabs the 10 most recent claims" do
      return_value = double(:return_value)
      Claim.stub_chain(:order, :limit).and_return(return_value)

      get 'index'
      expect(subject.instance_variable_get(:@recent_claims)).to be return_value
    end

    it "includes the most recent claim" do
      new_claim = Claim.create(author_id: 1, body: "Text")

      get 'index'
      expect(subject.instance_variable_get(:@recent_claims)).to include(new_claim)
    end
  end

end
