require 'spec_helper'

describe UsersController do
  let(:user) { User.create!(
                username: "PDiddy",
                email: "nobiggy@gmail.com",
                password: "password"
              )}

  # Write test for finding user by session[:user_id]

  context "@recent_claims" do
    let(:first_claim) { Claim.create(
                        body: "Lieing is always bad.",
                        author_id: user.id
                      )}

    let(:second_claim) { Claim.create(
                        body: "You shouldn't eat anything with a face.",
                        author_id: user.id
                       )}

    it "returns the claims in order of creation starting with most recently created." do
      get :index
      assigns(:recent_claims).first.should eq(second_claim)
    end

    it "it returns only 5 Claim objects" do
      10.times { Claim.create!(author_id: user.id, body: Faker::Lorem.word) }
      get :index
      assigns(:recent_claims).length.to eq(5) 
    end
  end

  context "@recent_arguments" do
    let (:conclusion) { Claim.create(
                        body: "Lieing is always bad.",
                        author_id: user.id
                      )}

    let(:first_argument) { Argument.create!(
                        conclusion_id: conclusion.id,
                        author_id: user.id,
                        is_supporting: true
                      )}

    let(:second_argument) { Argument.create!(
                        conclusion_id: conclusion.id,
                        author_id: user.id,
                        is_supporting: false
                       )}

    it "returns the arguments in order of creation starting with most recently created." do
      get :index
      assigns(:recent_arguments).first.should eq(second_argument)
    end

    it "it returns only 5 argument objects" do
      10.times { Argument.create!(
                  conclusion_id: conclusion.id,
                  author_id: user.id,
                  is_supporting: false
                )}
      
      get :index
      assigns(:recent_arguments).length.to eq(5) 
    end
end
