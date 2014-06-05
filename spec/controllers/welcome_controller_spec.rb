require 'spec_helper'

describe WelcomeController do

  context "the recent claim instance variable is right" do

    it "adds the most recent claim first in @recent_claims" do
      claim1 = Claim.create(author_id: 1, body: "Hello")
      get :index
      assigns(:recent_claims).first.should eq(claim1)
    end

    it "adds the second most recent claim second in @recent_claims" do
      claim1 = Claim.create(author_id: 1, body: "Hello")
      claim2 = Claim.create(author_id: 1, body: "Bye")
      get :index
      assigns(:recent_claims)[1].should eq(claim1)
    end

    it "only adds 10 items to @recent_claims" do
      claim1 = Claim.create(author_id: 1, body: "Hello")
      claim2 = Claim.create(author_id: 1, body: "Hello")
      claim3 = Claim.create(author_id: 1, body: "Hello")
      claim4 = Claim.create(author_id: 1, body: "Hello")
      claim5 = Claim.create(author_id: 1, body: "Hello")
      claim6 = Claim.create(author_id: 1, body: "Hello")
      claim7 = Claim.create(author_id: 1, body: "Hello")
      claim8 = Claim.create(author_id: 1, body: "Hello")
      claim9 = Claim.create(author_id: 1, body: "Hello")
      claim10 = Claim.create(author_id: 1, body: "Hello")
      claim11 = Claim.create(author_id: 1, body: "Hello")
      get :index
      assigns(:recent_claims).length.should eq(10)
    end
  end

  context "the recent arguments instance variable is right" do

    it "adds the most recent argument first in @recent_arguments" do
      argument1 = Argument.create(author_id: 1, conclusion_id: 1, is_supporting: true)
      get :index
      assigns(:recent_arguments).first.should eq(argument1)
    end

    it "adds the second most recent argument second in @recent_claims" do
      argument1 = Argument.create(author_id: 1, conclusion_id: 1, is_supporting: true)
      argument2 = Argument.create(author_id: 2, conclusion_id: 2, is_supporting: false)
      get :index
      assigns(:recent_arguments)[1].should eq(argument1)
    end

    it "only adds 10 items to @recent_arguments" do
      argument1 = Argument.create(author_id: 1, conclusion_id: 1, is_supporting: true)
      argument2 = Argument.create(author_id: 1, conclusion_id: 1, is_supporting: true)
      argument3 = Argument.create(author_id: 1, conclusion_id: 1, is_supporting: true)
      argument4 = Argument.create(author_id: 1, conclusion_id: 1, is_supporting: true)
      argument5 = Argument.create(author_id: 1, conclusion_id: 1, is_supporting: true)
      argument6 = Argument.create(author_id: 1, conclusion_id: 1, is_supporting: true)
      argument7 = Argument.create(author_id: 1, conclusion_id: 1, is_supporting: true)
      argument8 = Argument.create(author_id: 1, conclusion_id: 1, is_supporting: true)
      argument9 = Argument.create(author_id: 1, conclusion_id: 1, is_supporting: true)
      argument10 = Argument.create(author_id: 1, conclusion_id: 1, is_supporting: true)
      argument11 = Argument.create(author_id: 1, conclusion_id: 1, is_supporting: true)
      get :index
      assigns(:recent_arguments).length.should eq(10)
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
