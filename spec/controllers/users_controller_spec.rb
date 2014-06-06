require 'spec_helper'

describe UsersController do
  describe "#create" do
    subject { post :create, :user => {username: "duckling", email: "ugly@duckling.com", password: "password", image_url: 'http://curiousanimals.net/wp-content/uploads/2008/05/nice-duckling.jpg'}}

    it "redirects to profile page" do
      subject.should redirect_to(user_url(assigns(:user)))
    end
  end

end
