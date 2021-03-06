require_relative '../spec_helper'

describe Claim do
  describe "has attributes" do
    let(:user) { User.create(username: "Phil", email: "be@ge.com", password: "password" )}
    let(:claim) { Claim.new(author_id: user.id, body: "Everything is awesome.") }

    it "has an author_id" do
      expect(claim.author_id).to eq(user.id)
    end

    # it "has an author" do
    #   expect(claim.author.class).to eq(User)
    # end

    it "has a body" do
      expect(claim.body).to eq("Everything is awesome.")
    end
  end

  describe "has necessary associations" do
    it { should belong_to(:author).class_name('User') }
    it { should have_many(:arguments_where_conclusion).class_name('Argument').with_foreign_key('conclusion_id')}
    it { should have_many(:assumptions_where_premise).class_name('Assumption').with_foreign_key('premise_id')}
    it { should have_many(:arguments_where_premise).through(:assumptions_where_premise).source(:argument)}
    it { should have_many(:votes).with_foreign_key(:voteable_id)}
  end

  describe "has validations:" do
    it "its body should not be empty" do
      should validate_presence_of(:body)
    end

    it "its body should have no more than 140 characters" do
      should ensure_length_of(:body).is_at_most(140).with_long_message("Its like Twitter, only 140 characters per claim.  That's fun!")
    end

    xit "it should have a reference to an author" do
      should validate_presence_of(:author)
    end
  end

  describe "most_recent_first" do
    it "orders the results starting with most recent" do
      3.times do |i|
        Claim.create!(:body => i.to_s)
      end

      recent_claim = Claim.all.most_recent_first.first
      
      expect(recent_claim.body).to eq("2")
    end

  end

end
