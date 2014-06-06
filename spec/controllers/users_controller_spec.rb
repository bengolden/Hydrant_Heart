require 'spec_helper'

describe UsersController do
  let!(:user) { User.create!(
                username: "Puffy",
                email: "nobiggy@gmail.com",
                password: "password"
              )}

  describe "#new" do
    it "creates a temporary user" do
      expect(User).to receive(:new)
      get 'new'
    end
  end

  describe "#create" do
    subject { post :create, :user => {username: "duckling", email: "ugly@duckling.com", password: "password", image_url: 'http://curiousanimals.net/wp-content/uploads/2008/05/nice-duckling.jpg'}}


    it "creates a new user" do
      assigns(:user).should be_a(User)
    end

    it "redirects to profile page" do
      get 'new'
      subject.should redirect_to(user_url(assigns(:user)))
    end

  end


  context "@recent_claims" do
    xit "returns the claims in order of creation starting with most recently created." do

      user.authored_claims << Claim.create!(
        body: "Lieing is always bad."
      )

      user.authored_claims << Claim.create!(
        body: "Lieing is always good."
      )

      get :show, {:id => user.id}
      assigns(:recent_claims).first.body.should eq("Lieing is always good.")
    end

    xit "it returns only 5 Claim objects" do
      10.times { Claim.create!(author_id: user.id, body: Faker::Lorem.word) }

      get :show, {:id => user.id}
      assigns(:recent_claims).length.should == 5
    end
  end

  context "@recent_arguments" do
    let (:conclusion) { Claim.create!(
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

    xit "it returns only 5 argument objects" do
      10.times { Argument.create!(
                  conclusion_id: conclusion.id,
                  author_id: user.id,
                  is_supporting: false
                )}


      get :show, {:id => user.id}
      assigns(:recent_arguments).length.should == 5
    end
  end
end
