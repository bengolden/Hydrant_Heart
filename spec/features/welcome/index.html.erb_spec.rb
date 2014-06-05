require_relative '../../spec_helper'

feature "welcome/index.html.erb" do
  context "on homepage" do

    let(:user) { User.create(username: "Phil", email: "be@ge.com", password: "password" )}
    let(:conclusion) { Claim.create(body: "monkey fart", author_id: user.id )}

    it "has a Recent Claims heading" do
      visit '/'
      expect(page).to have_content("Recent Claims")
    end

    it "sees a list of recent claims" do
      Claim.create!(author_id: user.id, body: "The world is flat")
      visit '/'
      expect(page).to have_content("The world is flat")
    end

    it "can click the body of a claim and go to claim page" do
      pending("needs the claims controller")
      claim = Claim.create!(author_id: user.id, body: "The world is flat")
      visit '/'
      click_on "The world is flat"
      expect(page.current_path).to eq("/claims/#{claim.id}")
    end

    it "has a Recent Arguments heading" do
      visit '/'
      expect(page).to have_content("Recent Arguments")
    end

    it "sees a list of recent arguments" do
      argument = Argument.create(author_id: user.id, conclusion_id: conclusion.id, is_supporting: false)
      visit '/'
      expect(page).to have_content("New argument opposing 'monkey fart' by Phil")
    end

    it "can click an argument and go to argument page" do
      pending("need welcome controller tests first, then will need arguments controller")
      claim = Claim.create(author_id: 1, body: "The world is flat")
      author = User.create(username: "henry")
      argument = Argument.create(author_id: 2, conclusion_id: 4, is_supporting: false)
      visit '/'
      click_on "New argument opposing 'The world is flat' by henry"
      expect(page.current_path).to eq("/arguments/#{argument.id}")
    end

  end

end
