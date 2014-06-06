require_relative '../../spec_helper'

feature 'users/index.html.erb' do  
  let(:user) { User.create!(username: "Phil", email: "be@ge.com", password: "password", img_url: "http://fc08.deviantart.net/fs70/f/2012/199/4/3/eddsworld___unknown_profile_by_xnamenloserx-d57qvfm.jpg" )}
  let(:conclusion) { Claim.create!(body: "Capitalism drives innovation", author_id: user.id )}
  let(:argument) { Argument.create!(author_id: user.id, conclusion_id: conclusion.id, is_supporting: false) }
  let(:head_claim) { Claim.create!(author_id: user.id, body: "Capitalism drives inequality")}

  it "should display an img associated with the user"

  it "it should have a welcome heading displaying the user "

end