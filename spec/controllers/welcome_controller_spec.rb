require 'spec_helper'

describe WelcomeController do
  let(:user) { User.create(username: "Phil", email: "be@ge.com", password: "password" )}

  context "the recent claim instance variable is right" do

    it "adds the most recent claim first in @recent_claims" do
      claim1 = Claim.create!(body: "Hello", author_id: 1)
      get :index
      assigns(:recent_claims).first.should eq(claim1)
    end

    it "adds the second most recent claim second in @recent_claims" do
      user1 = User.create(email: "justin@email.com", username: "justin", password: "password", image_url: "http://www.aquariumfish.net/images_01/cambodian_betta_male_120217b6_w0640.jpg")
      claim1 = Claim.create(author_id: 1, body: "Hello")
      claim2 = Claim.create(author_id: 1, body: "Bye")
      get :index
      assigns(:recent_claims)[1].should eq(claim1)
    end

    it "only adds 10 items to @recent_claims" do
      claim1 = Claim.create!(author_id: user.id, body: "Hello")
      claim2 = Claim.create!(author_id: user.id, body: "Hello")
      claim3 = Claim.create!(author_id: user.id, body: "Hello")
      claim4 = Claim.create(author_id: user.id, body: "Hello")
      claim5 = Claim.create(author_id: user.id, body: "Hello")
      claim6 = Claim.create(author_id: user.id, body: "Hello")
      claim7 = Claim.create(author_id: user.id, body: "Hello")
      claim8 = Claim.create(author_id: user.id, body: "Hello")
      claim9 = Claim.create(author_id: user.id, body: "Hello")
      claim10 = Claim.create(author_id: user.id, body: "Hello")
      claim11 = Claim.create(author_id: user.id, body: "Hello")
      get :index
      assigns(:recent_claims).length.should eq(10)
    end
  end

  context "the recent arguments instance variable is right" do
  let(:conclusion) { Claim.create(body: "monkey fart", author_id: user.id )}
  let(:conclusion2) { Claim.create(body: "steamed clams", author_id: user.id )}

    it "adds the most recent argument first in @recent_arguments" do
      argument1 = Argument.create(author_id: user.id, conclusion_id: conclusion.id, is_supporting: true)
      get :index
      assigns(:recent_arguments).first.should eq(argument1)
    end

    it "adds the second most recent argument second in @recent_claims" do
      argument1 = Argument.create(author_id: user.id, conclusion_id: conclusion.id, is_supporting: true)
      argument2 = Argument.create(author_id: user.id, conclusion_id: conclusion2.id, is_supporting: false)
      get :index
      assigns(:recent_arguments)[1].should eq(argument1)
    end

    it "only adds 10 items to @recent_arguments" do
      argument1 = Argument.create(author_id: user.id, conclusion_id: conclusion.id, is_supporting: true)
      argument2 = Argument.create(author_id: user.id, conclusion_id: conclusion.id, is_supporting: true)
      argument3 = Argument.create(author_id: user.id, conclusion_id: conclusion.id, is_supporting: true)
      argument4 = Argument.create(author_id: user.id, conclusion_id: conclusion2.id, is_supporting: true)
      argument5 = Argument.create(author_id: user.id, conclusion_id: conclusion2.id, is_supporting: true)
      argument6 = Argument.create(author_id: user.id, conclusion_id: conclusion2.id, is_supporting: true)
      argument7 = Argument.create(author_id: user.id, conclusion_id: conclusion.id, is_supporting: true)
      argument8 = Argument.create(author_id: user.id, conclusion_id: conclusion.id, is_supporting: true)
      argument9 = Argument.create(author_id: user.id, conclusion_id: conclusion.id, is_supporting: true)
      argument10 = Argument.create(author_id: user.id, conclusion_id: conclusion2.id, is_supporting: true)
      argument11 = Argument.create(author_id: user.id, conclusion_id: conclusion.id, is_supporting: true)
      get :index
      assigns(:recent_arguments).length.should eq(10)
    end
  end



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
