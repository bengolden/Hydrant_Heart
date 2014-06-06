require_relative '../../spec_helper'

feature "claims/show.html.erb" do
  context "on each claims page" do

    let(:user) { User.create(username: "Phil", email: "be@ge.com", password: "password" )}
    let(:claim) { Claim.create(body: "monkey", author_id: user.id )}


    it "has a Recent Claims heading" do
      @claim.premises << stub(@claim)
      visit "/claims/#{claim.id}"
      expect(page).to have_content("monkey")
    end

    it "has a button to agree" do
      visit "/claims/#{claim.id}"
      should have_selector('button', value: "Agree")
    end

  end
end
