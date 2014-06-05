require_relative '../spec_helper'


feature "User browing the website" do 
	context "on Argument page" do

# Why does "let" create a new instace of the below varaiables every time while before creates them once and permanently?
		let(:user) {User.create(username: "SammyR", email: "samrihawi@test.com", password: "test")}
		let(:conclusion) {Claim.create(author_id: user.id, body: "God exists (conclusion")}
		let(:argument) {Argument.create(author_id: user.id, conclusion_id: conclusion.id, is_supporting: true)}

		let(:premise1) {Claim.create(author_id: user.id, body: "God is omnibenevolent")}
		let(:premise2) {Claim.create(author_id: user.id, body: "God is omnipotent")}
		let(:premise3) {Claim.create(author_id: user.id, body: "God is omniscient")}
		
		let(:assumption) {Assumption.create(premise_id: premise1.id, argument_id: argument.id)}
		let(:assumption) {Assumption.create(premise_id: premise2.id, argument_id: argument.id)}
		let(:assumption) {Assumption.create(premise_id: premise3.id, argument_id: argument.id)}
		
		before(:each) do 
			visit("/arguments/#{argument.id}")
		end

		it "sees a conclusion and an author" do
			expect(page).to have_content(user.username)
			expect(page).to have_content(conclusion.body)
		end

		it "sees a premise(s) that suppots the conclusion" do
			expect(page).to have_content(premise1.body)
			expect(page).to have_content(premise2.body)
			expect(page).to have_content(premise3.body)
		end



	end
end